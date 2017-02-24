from __future__ import division

import argparse
import configparser
import datetime
import json
import logging
import os
import queue
import re
import signal
import socket
import sys
import threading
import time

import docker
import pyzabbix

import version


class DockerDiscoveryService(threading.Thread):
    """This class implements the discovery service which discovers containers and images"""

    def __init__(self, config, stop_event, docker_client, zabbix_sender):
        """Initialize a new instance"""

        super(DockerDiscoveryService, self).__init__()
        self._logger = logging.getLogger(self.__class__.__name__)
        self._workers = []
        self._containers_queue = queue.Queue()
        self._config = config
        self._stop_event = stop_event
        self._docker_client = docker_client
        self._zabbix_sender = zabbix_sender

    def run(self):
        """Execute the thread"""

        if self._config.getboolean("main", "containers"):
            worker = DockerDiscoveryContainersWorker(self._config, self._docker_client, self._zabbix_sender,
                                                     self._containers_queue)
            worker.setDaemon(True)
            self._workers.append(worker)

        if self._config.getboolean("discovery", "poll_events"):
            worker = DockerDiscoveryContainersEventsPollerWorker(self._config, self._docker_client, self)
            worker.setDaemon(True)
            self._workers.append(worker)

        self._logger.info("service started")

        if self._config.getint("discovery", "startup") > 0:
            self._stop_event.wait(self._config.getint("discovery", "startup"))

        for worker in self._workers:
            worker.start()

        while True:
            self.execute_containers_discovery()

            if self._stop_event.wait(self._config.getint("discovery", "interval")):
                break

        self._logger.info("service stopped")

    def execute(self):
        """Execute the service"""

        self._logger.debug("requesting discovery")
        self._containers_queue.put("discovery")

    def execute_containers_discovery(self):
        """Execute the service"""

        self._logger.debug("requesting containers discovery")
        self._containers_queue.put("discovery")


class DockerDiscoveryContainersWorker(threading.Thread):
    """This class implements a containers discovery worker thread"""

    def __init__(self, config, docker_client, zabbix_sender, containers_queue):
        """Initialize the thread"""

        super(DockerDiscoveryContainersWorker, self).__init__()
        self._logger = logging.getLogger(self.__class__.__name__)
        self._config = config
        self._docker_client = docker_client
        self._zabbix_sender = zabbix_sender
        self._containers_queue = containers_queue

    def run(self):
        """Execute the thread"""

        while True:
            self._logger.debug("waiting execution queue")
            item = self._containers_queue.get()
            if item is None:
                break

            self._logger.info("starting containers discovery")

            try:
                metrics = []
                discovery_containers = []
                discovery_containers_stats_cpus = []
                discovery_containers_stats_networks = []
                discovery_containers_stats_devices = []
                discovery_containers_top = []
                device_pattern = re.compile(r'^DEVNAME=(.+)$')

                containers = self._docker_client.containers(all=True)

                for container in containers:
                    container_id = container["Id"]
                    container_name = container["Names"][0][1:]

                    discovery_containers.append({
                        "{#NAME}": container_name
                    })

                    if container["Status"].startswith("Up"):
                        if self._config.getboolean("main", "containers_stats"):
                            container_stats = self._docker_client.stats(container_id, decode=True, stream=False)

                            if (
                                self._config.getboolean("containers_stats", "stats_cpus") and
                                "cpu_stats" in container_stats and
                                "cpu_usage" in container_stats["cpu_stats"] and
                                "percpu_usage" in container_stats["cpu_stats"]["cpu_usage"]
                            ):
                                cpus = len(container_stats["cpu_stats"]["cpu_usage"]["percpu_usage"])

                                for i in range(cpus):
                                    discovery_containers_stats_cpus.append({
                                        "{#NAME}": container_name,
                                        "{#CPU}": "%d" % i
                                    })

                            if (
                                self._config.getboolean("containers_stats", "stats_networks") and
                                "networks" in container_stats
                            ):
                                for container_stats_network_ifname in list(container_stats["networks"].keys()):
                                    discovery_containers_stats_networks.append({
                                        "{#NAME}": container_name,
                                        "{#IFNAME}": container_stats_network_ifname
                                    })

                            if (
                                self._config.getboolean("containers_stats", "stats_devices") and
                                "blkio_stats" in container_stats and
                                "io_serviced_recursive" in container_stats["blkio_stats"]
                            ):
                                for j in range(len(container_stats["blkio_stats"]["io_serviced_recursive"])):
                                    if container_stats["blkio_stats"]["io_serviced_recursive"][j]["op"] != "Total":
                                        continue

                                    sysfs_file = "%s/dev/block/%s:%s/uevent" % (
                                        os.path.join(self._config.get("main", "rootfs"), "sys"),
                                        container_stats["blkio_stats"]["io_serviced_recursive"][j]["major"],
                                        container_stats["blkio_stats"]["io_serviced_recursive"][j]["minor"])
                                    with open(sysfs_file) as f:
                                        for line in f:
                                            match = re.search(device_pattern, line)
                                            if not match:
                                                continue

                                            discovery_containers_stats_devices.append({
                                                "{#NAME}": container_name,
                                                "{#DEVMAJOR}": container_stats["blkio_stats"]
                                                ["io_serviced_recursive"][j]["major"],
                                                "{#DEVMINOR}": container_stats["blkio_stats"]
                                                ["io_serviced_recursive"][j]["minor"],
                                                "{#DEVNAME}": match.group(1)
                                            })

                        if self._config.getboolean("main", "containers_top"):
                            container_top = self._docker_client.top(container)
                            if "Processes" in container_top:
                                for j in range(len(container_top["Processes"])):
                                    discovery_containers_top.append({
                                        "{#NAME}": container_name,
                                        "{#PID}": container_top["Processes"][j][1],
                                        "{#CMD}": container_top["Processes"][j][7]
                                    })

                metrics.append(
                    pyzabbix.ZabbixMetric(
                        self._config.get("zabbix", "host"),
                        "docker.discovery.containers",
                        json.dumps({"data": discovery_containers})))

                if self._config.getboolean("main", "containers_stats"):
                    if self._config.getboolean("containers_stats", "stats_cpus"):
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.discovery.containers.stats.cpus",
                                json.dumps({"data": discovery_containers_stats_cpus})))

                    if self._config.getboolean("containers_stats", "stats_networks"):
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.discovery.containers.stats.networks",
                                json.dumps({"data": discovery_containers_stats_networks})))

                    if self._config.getboolean("containers_stats", "stats_devices"):
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.discovery.containers.stats.devices",
                                json.dumps({"data": discovery_containers_stats_devices})))

                if self._config.getboolean("main", "containers_top"):
                    metrics.append(
                        pyzabbix.ZabbixMetric(
                            self._config.get("zabbix", "host"),
                            "docker.discovery.containers.top",
                            json.dumps({"data": discovery_containers_top})))

                if len(metrics) > 0:
                    self._logger.debug("sending %d metrics" % len(metrics))
                    self._zabbix_sender.send(metrics)
            except (IOError, OSError):
                self._logger.error("failed to send containers discovery metrics")

                pass


class DockerDiscoveryContainersEventsPollerWorker(threading.Thread):
    """This class implements a containers discovery by events worker thread"""

    def __init__(self, config, docker_client, discovery_service):
        """Initialize the thread"""

        super(DockerDiscoveryContainersEventsPollerWorker, self).__init__()
        self._logger = logging.getLogger(self.__class__.__name__)
        self._config = config
        self._docker_client = docker_client
        self._discovery_service = discovery_service

    def run(self):
        """Execute the thread"""

        since = None
        until = None

        while True:
            since = datetime.datetime.utcnow() if until is None else until
            until = datetime.datetime.utcnow() + \
                datetime.timedelta(seconds=self._config.getint("discovery", "poll_events_interval"))

            containers_start = 0

            self._logger.info("querying containers events")
            for event in self._docker_client.events(since,
                                                    until,
                                                    {
                                                        "type": "container",
                                                        "event": "start"
                                                    },
                                                    True):
                self._logger.debug("new docker event: %s" % event)

                if event["status"] == "start":
                    containers_start += 1

            if containers_start > 0:
                self._discovery_service.execute_containers_discovery()


class DockerContainersService(threading.Thread):
    """This class implements the containers service thread"""

    def __init__(self, config, stop_event, docker_client, zabbix_sender):
        """Initialize the thread"""

        super(DockerContainersService, self).__init__()
        self._logger = logging.getLogger(self.__class__.__name__)
        self._workers = []
        self._queue = queue.Queue()
        self._config = config
        self._stop_event = stop_event
        self._docker_client = docker_client
        self._zabbix_sender = zabbix_sender

    def run(self):
        """Execute the thread"""

        worker = DockerContainersWorker(self._config, self._docker_client, self._zabbix_sender, self._queue)
        worker.setDaemon(True)
        self._workers.append(worker)

        self._logger.info("service started")

        if self._config.getint("containers", "startup") > 0:
            self._stop_event.wait(self._config.getint("containers", "startup"))

        for worker in self._workers:
            worker.start()

        while True:
            self.execute()

            if self._stop_event.wait(self._config.getint("containers", "interval")):
                break

        self._logger.info("service stopped")

    def execute(self):
        """Execute the service"""

        self._logger.debug("requesting containers metrics")
        self._queue.put("metrics")


class DockerContainersWorker(threading.Thread):
    """This class implements a containers worker thread"""

    def __init__(self, config, docker_client, zabbix_sender, containers_queue):
        """Initialize the thread"""

        super(DockerContainersWorker, self).__init__()
        self._logger = logging.getLogger(self.__class__.__name__)
        self._config = config
        self._docker_client = docker_client
        self._zabbix_sender = zabbix_sender
        self._containers_queue = containers_queue

    def run(self):
        """Execute the thread"""

        while True:
            self._logger.debug("waiting execution queue")
            item = self._containers_queue.get()
            if item is None:
                break

            self._logger.info("sending containers metrics")

            try:
                metrics = []

                containers = self._docker_client.containers(all=True)

                containers_total = len(containers)
                containers_running = 0
                containers_stopped = 0
                containers_healthy = 0
                containers_unhealthy = 0

                for container in containers:
                    container_name = container["Names"][0][1:]

                    if container["Status"].startswith("Up"):
                        containers_running += 1

                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.status[%s]" % container_name,
                                "%d" % 1
                            )
                        )

                        if container["Status"].find("(healthy)") != -1:
                            containers_healthy += 1

                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.health[%s]" % container_name,
                                    "%d" % 1
                                )
                            )
                        elif container["Status"].find("(unhealthy)") != -1:
                            containers_unhealthy += 1

                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.health[%s]" % container_name,
                                    "%d" % 0
                                )
                            )
                    else:
                        containers_stopped += 1

                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.status[%s]" % container_name,
                                "%d" % 0
                            )
                        )

                metrics.append(
                    pyzabbix.ZabbixMetric(
                        self._config.get("zabbix", "host"),
                        "docker.containers.total",
                        "%d" % containers_total
                    )
                )
                metrics.append(
                    pyzabbix.ZabbixMetric(
                        self._config.get("zabbix", "host"),
                        "docker.containers.running",
                        "%d" % containers_running
                    )
                )
                metrics.append(
                    pyzabbix.ZabbixMetric(
                        self._config.get("zabbix", "host"),
                        "docker.containers.stopped",
                        "%d" % containers_stopped
                    )
                )
                metrics.append(
                    pyzabbix.ZabbixMetric(
                        self._config.get("zabbix", "host"),
                        "docker.containers.healthy",
                        "%d" % containers_healthy
                    )
                )
                metrics.append(
                    pyzabbix.ZabbixMetric(
                        self._config.get("zabbix", "host"),
                        "docker.containers.unhealthy",
                        "%d" % containers_unhealthy
                    )
                )

                if len(metrics) > 0:
                    self._logger.debug("sending %d metrics" % len(metrics))
                    self._zabbix_sender.send(metrics)
            except (IOError, OSError):
                self._logger.error("failed to send containers metrics")

                pass


class DockerContainersStatsService(threading.Thread):
    """The class implements the containers stats service thread"""

    def __init__(self, config, stop_event, docker_client, zabbix_sender):
        super(DockerContainersStatsService, self).__init__()
        self._logger = logging.getLogger(self.__class__.__name__)
        self._queue = queue.Queue()
        self._workers = []
        self._config = config
        self._stop_event = stop_event
        self._docker_client = docker_client
        self._zabbix_sender = zabbix_sender
        self._containers_stats = {}

    def run(self):
        """Execute the thread"""

        for _ in (range(self._config.getint("containers_stats", "workers"))):
            worker = DockerContainersStatsWorker(self._config, self._docker_client, self._queue, self._containers_stats)
            worker.setDaemon(True)
            self._workers.append(worker)

        self._logger.info("service started")

        if self._config.getint("containers_stats", "startup") > 0:
            self._stop_event.wait(self._config.getint("containers_stats", "startup"))

        for worker in self._workers:
            worker.start()

        while True:
            self.execute()

            if self._stop_event.wait(self._config.getint("containers_stats", "interval")):
                break

        self._logger.info("service stopped")

    def execute(self):
        """Execute the service"""

        self._logger.info("sending available containers statistics metrics")

        try:
            metrics = []

            containers = self._docker_client.containers(all=True)

            for container_id in set(self._containers_stats) - set(map(lambda c: c["Id"], containers)):
                del self._containers_stats[container_id]

            containers_running = 0

            for container in containers:
                container_name = container["Names"][0][1:]

                if container["Status"].startswith("Up"):
                    self._queue.put(container)

                    containers_running += 1

                if container["Id"] in self._containers_stats:
                    container_stats = self._containers_stats[container["Id"]]["data"]
                    clock = self._containers_stats[container["Id"]]["clock"]

                    cpu = \
                        (container_stats["cpu_stats"]["cpu_usage"]["total_usage"] -
                         container_stats["precpu_stats"]["cpu_usage"]["total_usage"]) / \
                        (container_stats["cpu_stats"]["system_cpu_usage"] -
                         container_stats["precpu_stats"]["system_cpu_usage"]) * 100
                    cpu_system = \
                        (container_stats["cpu_stats"]["cpu_usage"]["usage_in_kernelmode"] -
                         container_stats["precpu_stats"]["cpu_usage"]["usage_in_kernelmode"]) / \
                        (container_stats["cpu_stats"]["system_cpu_usage"] -
                         container_stats["precpu_stats"]["system_cpu_usage"]) * 100
                    cpu_user = \
                        (container_stats["cpu_stats"]["cpu_usage"]["usage_in_usermode"] -
                         container_stats["precpu_stats"]["cpu_usage"]["usage_in_usermode"]) / \
                        (container_stats["cpu_stats"]["system_cpu_usage"] -
                         container_stats["precpu_stats"]["system_cpu_usage"]) * 100
                    cpu_periods = \
                        container_stats["cpu_stats"]["throttling_data"]["periods"] - \
                        container_stats["precpu_stats"]["throttling_data"]["periods"]
                    cpu_throttled_periods = \
                        container_stats["cpu_stats"]["throttling_data"]["throttled_periods"] - \
                        container_stats["precpu_stats"]["throttling_data"]["throttled_periods"]
                    cpu_throttled_time = \
                        container_stats["cpu_stats"]["throttling_data"]["throttled_time"] - \
                        container_stats["precpu_stats"]["throttling_data"]["throttled_time"]

                    metrics.append(
                        pyzabbix.ZabbixMetric(
                            self._config.get("zabbix", "host"),
                            "docker.containers.stats.cpu[%s]" % (
                                container_name),
                            "%.2f" % cpu,
                            clock))
                    metrics.append(
                        pyzabbix.ZabbixMetric(
                            self._config.get("zabbix", "host"),
                            "docker.containers.stats.cpu_system[%s]" % (
                                container_name),
                            "%.2f" % cpu_system,
                            clock))
                    metrics.append(
                        pyzabbix.ZabbixMetric(
                            self._config.get("zabbix", "host"),
                            "docker.containers.stats.cpu_user[%s]" % (
                                container_name),
                            "%.2f" % cpu_user,
                            clock))
                    metrics.append(
                        pyzabbix.ZabbixMetric(
                            self._config.get("zabbix", "host"),
                            "docker.containers.stats.cpu_periods[%s]" % (
                                container_name),
                            "%d" % cpu_periods,
                            clock))
                    metrics.append(
                        pyzabbix.ZabbixMetric(
                            self._config.get("zabbix", "host"),
                            "docker.containers.stats.cpu_throttled_periods[%s]" % (
                                container_name),
                            "%d" % cpu_throttled_periods,
                            clock))
                    metrics.append(
                        pyzabbix.ZabbixMetric(
                            self._config.get("zabbix", "host"),
                            "docker.containers.stats.cpu_throttled_time[%s]" % (
                                container_name),
                            "%d" % cpu_throttled_time,
                            clock))

                    memory = \
                        container_stats["memory_stats"]["usage"] / container_stats["memory_stats"]["limit"] * 100

                    metrics.append(
                        pyzabbix.ZabbixMetric(
                            self._config.get("zabbix", "host"),
                            "docker.containers.stats.memory[%s]" % (
                                container_name),
                            "%.2f" % memory,
                            clock))

                    proc = container_stats["pids_stats"]["current"]

                    metrics.append(
                        pyzabbix.ZabbixMetric(
                            self._config.get("zabbix", "host"),
                            "docker.containers.stats.proc[%s]" % (
                                container_name),
                            "%d" % proc,
                            clock))

                    if (
                        self._config.getboolean("containers_stats", "stats_cpus") and
                        "cpu_stats" in container_stats and
                        "cpu_usage" in container_stats["cpu_stats"] and
                        "percpu_usage" in container_stats["cpu_stats"]["cpu_usage"]
                    ):
                        for i in range(len(container_stats["cpu_stats"]["cpu_usage"]["percpu_usage"])):
                            percpu = (container_stats["cpu_stats"]["cpu_usage"]["percpu_usage"][i] -
                                      container_stats["precpu_stats"]["cpu_usage"]["percpu_usage"][i]) / \
                                (container_stats["cpu_stats"]["system_cpu_usage"] -
                                 container_stats["precpu_stats"]["system_cpu_usage"]) * 100

                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.percpu[%s,%d]" % (
                                        container_name, i),
                                    "%.2f" % percpu,
                                    clock))

                    if (
                        self._config.getboolean("containers_stats", "stats_memory") and
                        "memory_stats" in container_stats and
                        "stats" in container_stats["memory_stats"]
                    ):
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_active_anon[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["active_anon"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_active_file[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["active_file"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_cache[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["cache"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_dirty[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["dirty"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_hierarchical_memory_limit[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["hierarchical_memory_limit"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_hierarchical_memsw_limit[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["hierarchical_memsw_limit"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_inactive_anon[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["inactive_anon"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_inactive_file[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["inactive_file"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_mapped_file[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["mapped_file"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_pgfault[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["pgfault"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_pgmajfault[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["pgmajfault"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_pgpgin[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["pgpgin"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_pgpgout[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["pgpgout"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_rss[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["rss"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_rss_huge[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["rss_huge"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_swap[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["swap"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_unevictable[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["unevictable"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.stats_writeback[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["stats"]["writeback"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.max_usage[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["max_usage"]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.usage[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["usage"]),
                                clock))
                        # Fix docker 1.13.0
                        if "failcnt" in container_stats["memory_stats"]:
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.failcnt[%s]" % (
                                        container_name),
                                    "%d" % (
                                        container_stats["memory_stats"]["failcnt"]),
                                    clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.stats.memory_stats.limit[%s]" % (
                                    container_name),
                                "%d" % (
                                    container_stats["memory_stats"]["limit"]),
                                clock))

                        if containers_running == 1:
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_active_anon",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_active_anon"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_active_file",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_active_file"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_cache",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_cache"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_dirty",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_dirty"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_inactive_anon",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_inactive_anon"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_inactive_file",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_inactive_file"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_mapped_file",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_mapped_file"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_pgfault",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_pgfault"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_pgmajfault",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_pgmajfault"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_pgpgout",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_pgpgout"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_pgpgin",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_pgpgin"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_rss",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_rss"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_rss_huge",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_rss_huge"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_swap",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_swap"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_unevictable",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_unevictable"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.memory_stats.stats_total_writeback",
                                    "%d" % (
                                        container_stats["memory_stats"]["stats"]["total_writeback"]),
                                    clock))

                    if (
                        self._config.getboolean("containers_stats", "stats_networks") and
                        'networks' in container_stats
                    ):
                        for container_stats_network_ifname in list(container_stats["networks"].keys()):
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.networks.rx_bytes[%s,%s]" % (
                                        container_name,
                                        container_stats_network_ifname),
                                    "%d" % (
                                        container_stats["networks"][container_stats_network_ifname]["rx_bytes"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.networks.rx_dropped[%s,%s]" % (
                                        container_name,
                                        container_stats_network_ifname),
                                    "%d" % (
                                        container_stats["networks"][container_stats_network_ifname]["rx_dropped"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.networks.rx_errors[%s,%s]" % (
                                        container_name,
                                        container_stats_network_ifname),
                                    "%d" % (
                                        container_stats["networks"][container_stats_network_ifname]["rx_errors"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.networks.rx_packets[%s,%s]" % (
                                        container_name,
                                        container_stats_network_ifname),
                                    "%d" % (
                                        container_stats["networks"][container_stats_network_ifname]["rx_packets"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.networks.tx_bytes[%s,%s]" % (
                                        container_name,
                                        container_stats_network_ifname),
                                    "%d" % (
                                        container_stats["networks"][container_stats_network_ifname]["tx_bytes"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.networks.tx_dropped[%s,%s]" % (
                                        container_name,
                                        container_stats_network_ifname),
                                    "%d" % (
                                        container_stats["networks"][container_stats_network_ifname]["tx_dropped"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.networks.tx_errors[%s,%s]" % (
                                        container_name,
                                        container_stats_network_ifname),
                                    "%d" % (
                                        container_stats["networks"][container_stats_network_ifname]["tx_errors"]),
                                    clock))
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.networks.tx_packets[%s,%s]" % (
                                        container_name,
                                        container_stats_network_ifname),
                                    "%d" % (
                                        container_stats["networks"][container_stats_network_ifname]["tx_packets"]),
                                    clock))

                    if (
                        self._config.getboolean("containers_stats", "stats_devices") and
                        "blkio_stats" in container_stats and
                        "io_serviced_recursive" in container_stats["blkio_stats"] and
                        "io_service_bytes_recursive" in container_stats["blkio_stats"]
                    ):
                        for i in range(len(container_stats["blkio_stats"]["io_serviced_recursive"])):
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.blkio_stats.io[%s,%d,%d,%s]" % (
                                        container_name,
                                        container_stats["blkio_stats"]["io_serviced_recursive"][i]["major"],
                                        container_stats["blkio_stats"]["io_serviced_recursive"][i]["minor"],
                                        container_stats["blkio_stats"]["io_serviced_recursive"][i]["op"]),
                                    "%d" % (
                                        container_stats["blkio_stats"]["io_serviced_recursive"][i]["value"]),
                                    clock))

                        for i in range(len(container_stats["blkio_stats"]["io_service_bytes_recursive"])):
                            metrics.append(
                                pyzabbix.ZabbixMetric(
                                    self._config.get("zabbix", "host"),
                                    "docker.containers.stats.blkio_stats.io_bytes[%s,%d,%d,%s]" % (
                                        container_name,
                                        container_stats["blkio_stats"]["io_service_bytes_recursive"][i]["major"],
                                        container_stats["blkio_stats"]["io_service_bytes_recursive"][i]["minor"],
                                        container_stats["blkio_stats"]["io_service_bytes_recursive"][i]["op"]),
                                    "%d" % (
                                        container_stats["blkio_stats"]["io_service_bytes_recursive"][i]["value"]),
                                    clock))

            if len(metrics) > 0:
                self._logger.debug("sending %d metrics" % len(metrics))
                self._zabbix_sender.send(metrics)
        except (IOError, OSError):
            self._logger.error("failed to send containers statistics metrics")

            pass


class DockerContainersStatsWorker(threading.Thread):
    """This class implements a containers stats worker thread"""

    def __init__(self, config, docker_client, containers_stats_queue, containers_stats):
        """Initialize the thread"""

        super(DockerContainersStatsWorker, self).__init__()
        self._logger = logging.getLogger(self.__class__.__name__)
        self._config = config
        self._docker_client = docker_client
        self._containers_stats_queue = containers_stats_queue
        self._containers_stats = containers_stats

    def run(self):
        """Execute the thread"""

        while True:
            self._logger.debug("waiting execution queue")
            container = self._containers_stats_queue.get()
            if container is None:
                break

            self._logger.info("querying statistics metrics for container %s" % container["Id"])

            try:
                data = self._docker_client.stats(container, decode=True, stream=False)

                self._containers_stats[container["Id"]] = {
                    "data": data,
                    "clock": time.time()
                }
            except (IOError, OSError):
                self._logger.error("failed to get statistics metrics for container %s" % container["Id"])

                pass


class DockerContainersTopService(threading.Thread):
    """This class implements the containers top service thread"""

    def __init__(self, config, stop_event, docker_client, zabbix_sender):
        """Initialize the thread"""

        super(DockerContainersTopService, self).__init__()
        self._logger = logging.getLogger(self.__class__.__name__)
        self._workers = []
        self._queue = queue.Queue()
        self._config = config
        self._stop_event = stop_event
        self._docker_client = docker_client
        self._zabbix_sender = zabbix_sender
        self._containers_top = {}

    def run(self):
        """Execute the thread"""

        for _ in (range(self._config.getint("containers_top", "workers"))):
            worker = DockerContainersTopWorker(self._config, self._docker_client, self._queue, self._containers_top)
            worker.setDaemon(True)
            self._workers.append(worker)

        self._logger.info("service started")

        if self._config.getint("containers_top", "startup") > 0:
            self._stop_event.wait(self._config.getint("containers_top", "startup"))

        for worker in self._workers:
            worker.start()

        while True:
            self.execute()

            if self._stop_event.wait(self._config.getint("containers_top", "interval")):
                break

        self._logger.info("service stopped")

    def execute(self):
        """Execute the service"""

        self._logger.info("sending available containers top metrics")

        try:
            metrics = []

            containers = self._docker_client.containers()

            for container_id in set(self._containers_top) - set(map(lambda c: c["Id"], containers)):
                del self._containers_top[container_id]

            for container in containers:
                container_name = container["Names"][0][1:]

                if container["Status"].startswith("Up"):
                    self._queue.put(container)

                if container["Id"] in self._containers_top:
                    container_top = self._containers_top[container["Id"]]["data"]
                    clock = self._containers_top[container["Id"]]["clock"]

                    for i in range(len(container_top["Processes"])):
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.top.cpu[%s,%s]" % (
                                    container_name,
                                    container_top["Processes"][i][1]),
                                "%s" % (container_top["Processes"][i][2]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.top.mem[%s,%s]" % (
                                    container_name,
                                    container_top["Processes"][i][1]),
                                "%s" % (container_top["Processes"][i][3]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.top.vsz[%s,%s]" % (
                                    container_name,
                                    container_top["Processes"][i][1]),
                                "%s" % (container_top["Processes"][i][4]),
                                clock))
                        metrics.append(
                            pyzabbix.ZabbixMetric(
                                self._config.get("zabbix", "host"),
                                "docker.containers.top.rss[%s,%s]" % (
                                    container_name,
                                    container_top["Processes"][i][1]),
                                "%s" % (container_top["Processes"][i][5]),
                                clock))

            if len(metrics) > 0:
                self._logger.debug("sending %d metrics" % len(metrics))
                self._zabbix_sender.send(metrics)
        except (IOError, OSError):
            self._logger.error("failed to send containers top metrics")

            pass


class DockerContainersTopWorker(threading.Thread):
    """This class implements a containers top worker thread"""

    def __init__(self, config, docker_client, containers_top_queue, containers_top):
        """Initialize the thread"""

        super(DockerContainersTopWorker, self).__init__()
        self._logger = logging.getLogger(self.__class__.__name__)
        self._config = config
        self._docker_client = docker_client
        self._containers_top_queue = containers_top_queue
        self._containers_top = containers_top

    def run(self):
        """Execute the thread"""

        while True:
            self._logger.debug("waiting execution queue")
            container = self._containers_top_queue.get()
            if container is None:
                break

            self._logger.info("querying top metrics for container %s" % container["Id"])

            try:
                data = self._docker_client.top(container, "aux")

                self._containers_top[container["Id"]] = {
                    "data": data,
                    "clock": time.time()
                }
            except (IOError, OSError):
                self._logger.error("failed to get top metrics for container %s" % container["Id"])

                pass


class DockerContainersRemoteService(threading.Thread):
    """This class implements the containers remote service thread"""

    def __init__(self, config, stop_event, docker_client, zabbix_sender):
        """Initialize the thread"""

        super(DockerContainersRemoteService, self).__init__()
        self._logger = logging.getLogger(self.__class__.__name__)
        self._workers = []
        self._queue = queue.Queue()
        self._config = config
        self._stop_event = stop_event
        self._docker_client = docker_client
        self._zabbix_sender = zabbix_sender
        self._containers_outputs = {}
        self._counter = 0
        self._lock = threading.Lock()

    def run(self):
        """Execute the thread"""

        for _ in (range(self._config.getint("containers_remote", "workers"))):
            worker = DockerContainersRemoteWorker(self._config, self._docker_client, self, self._queue,
                                                  self._containers_outputs)
            worker.setDaemon(True)
            self._workers.append(worker)

        self._logger.info("service started")

        if self._config.getint("containers_remote", "startup") > 0:
            self._stop_event.wait(self._config.getint("containers_remote", "startup"))

        for worker in self._workers:
            worker.start()

        while True:
            self.execute()

            if self._stop_event.wait(self._config.getint("containers_remote", "interval")):
                break

        self._logger.info("service stopped")

    def execute(self):
        """Execute the service"""

        with self._lock:
            if self._counter > self._config.getint("containers_remote", "interval"):
                self._counter = 0

            self._counter += 1

        self._logger.info("sending available containers trappers metrics")

        try:
            metrics = []

            containers = self._docker_client.containers()

            for container_id in set(self._containers_outputs) - set(map(lambda c: c["Id"], containers)):
                del self._containers_outputs[container_id]

            for container in containers:
                if container["Status"].startswith("Up"):
                    self._queue.put(container)

                if container["Id"] in self._containers_outputs:
                    container_output = self._containers_outputs[container["Id"]]["data"]
                    clock = self._containers_outputs[container["Id"]]["clock"]

                    if self._config.getboolean("containers_remote", "trappers"):
                        for line in container_output.splitlines():
                            if self._config.getboolean("containers_remote", "trappers_timestamp"):
                                m = re.match(r'^([^\s]+){1} (([^\s\[]+){1}(?:\[([^\s]+){1}\])?){1} '
                                             r'(\d+){1} (?:"?((?:\\.|[^"])+)"?){1}$', line)
                                if m:
                                    hostname = self._config.get("zabbix", "host") if m.group(1) == "-" else m.group(1)
                                    key = m.group(2)
                                    timestamp = int(m.group(5)) if m.group(5) == int(m.group(5)) else clock
                                    value = re.sub(r'\\(.)', "\\1", m.group(6))

                                    metrics.append(pyzabbix.ZabbixMetric(hostname, key, value, timestamp))
                            else:
                                m = re.match(r'^([^\s]+){1} (([^\s\[]+){1}(?:\[([^\s]+){1}\])?){1} '
                                             r'(?:"?((?:\\.|[^"])+)"?){1}$', line)
                                if m:
                                    hostname = self._config.get("zabbix", "host") if m.group(1) == "-" else m.group(1)
                                    key = m.group(2)
                                    timestamp = clock
                                    value = re.sub(r'\\(.)', "\\1", m.group(5))

                                    metrics.append(pyzabbix.ZabbixMetric(hostname, key, value, timestamp))

            if len(metrics) > 0:
                self._logger.debug("sending %d metrics" % len(metrics))
                self._zabbix_sender.send(metrics)
        except (IOError, OSError):
            self._logger.error("failed to send containers trappers metrics")

            pass

    def counter(self):
        return self._counter


class DockerContainersRemoteWorker(threading.Thread):
    """This class implements a containers remote worker thread"""

    def __init__(self, config, docker_client, containers_remote_service, containers_remote_queue, containers_outputs):
        """Initialize the thread"""

        super(DockerContainersRemoteWorker, self).__init__()
        self._logger = logging.getLogger(self.__class__.__name__)
        self._config = config
        self._docker_client = docker_client
        self._containers_remote_service = containers_remote_service
        self._containers_remote_queue = containers_remote_queue
        self._containers_outputs = containers_outputs

    def run(self):
        """Execute the thread"""

        while True:
            self._logger.debug("waiting execution queue")
            container = self._containers_remote_queue.get()
            if container is None:
                break

            self._logger.info("executing remote command(s) in container %s" % container["Id"])

            try:
                paths = self._config.get("containers_remote", "path").split(os.pathsep)
                delays = self._config.get("containers_remote", "delay").split(os.pathsep)

                for index, path in enumerate(paths):
                    delay = min(int(delays[index]) if ((len(delays) > index) and (int(delays[index]) > 0)) else 1,
                                int(self._config.get("containers_remote", "interval")))

                    if self._containers_remote_service.counter() % delay != 0:
                        self._logger.debug("command is delayed to next execution")
                        continue

                    cmd = self._docker_client.exec_create(
                        container,
                        "/bin/sh -c \"stat %s >/dev/null 2>&1 && /usr/bin/find %s -type f -maxdepth 1 -perm /700"
                        " -exec {} \; || /bin/true\"" % (path, path),
                        stderr=True,
                        tty=True, user=self._config.get("containers_remote", "user"))

                    data = self._docker_client.exec_start(cmd)

                    inspect = self._docker_client.exec_inspect(cmd)
                    if inspect["ExitCode"] == 0:
                        self._containers_outputs[container["Id"]] = {
                            "data": str(data, 'utf-8'),
                            "clock": time.time()
                        }
                    else:
                        self._logger.error("a remote command execution has failed in container %s" % container["Id"])
            except (IOError, OSError):
                self._logger.error("failed to execute remote command(s) in container %s" % container["Id"])

                pass


class DockerEventsService(threading.Thread):
    """This class implements the events service thread"""

    def __init__(self, config, stop_event, docker_client, zabbix_sender, discovery_service):
        """Initialize the thread"""

        super(DockerEventsService, self).__init__()
        self._logger = logging.getLogger(self.__class__.__name__)
        self._workers = []
        self._events_queue = queue.Queue()
        self._config = config
        self._stop_event = stop_event
        self._docker_client = docker_client
        self._zabbix_sender = zabbix_sender
        self._discovery_service = discovery_service

    def run(self):
        """Execute the thread"""

        worker = DockerEventsPollerWorker(self._config, self._docker_client, self._zabbix_sender, self._events_queue)
        worker.setDaemon(True)
        self._workers.append(worker)

        self._logger.info("service started")

        if self._config.getint("events", "startup") > 0:
            self._stop_event.wait(self._config.getint("events", "startup"))

        for worker in self._workers:
            worker.start()

        while True:
            self.execute()

            if self._stop_event.wait(self._config.getint("events", "interval")):
                break

        self._logger.info("service stopped")

    def execute(self):
        """Execute the service"""

        self._logger.debug("requesting service execution")
        self._events_queue.put("metrics")


class DockerEventsPollerWorker(threading.Thread):
    """This class implements a events poller worker thread"""

    def __init__(self, config, docker_client, zabbix_sender, events_queue):
        """Intialize the thread"""

        super(DockerEventsPollerWorker, self).__init__()
        self._logger = logging.getLogger(self.__class__.__name__)
        self._config = config
        self._docker_client = docker_client
        self._zabbix_sender = zabbix_sender
        self._events_queue = events_queue

    def run(self):
        """Execute the thread"""

        since = None
        until = datetime.datetime.utcnow() - datetime.timedelta(seconds=1)

        while True:
            self._logger.debug("waiting execution queue")
            item = self._events_queue.get()
            if item is None:
                break

            self._logger.info("sending events metrics")

            try:
                since = until
                until = datetime.datetime.utcnow()

                events_container_create = 0
                events_container_start = 0
                events_container_die = 0
                events_container_oom = 0
                events_container_kill = 0
                events_container_stop = 0
                events_container_destroy = 0

                for event in self._docker_client.events(since,
                                                        until,
                                                        {"type": "container"},
                                                        True):
                    if event["status"] == "create":
                        events_container_create += 1

                    if event["status"] == "start":
                        events_container_start += 1

                    if event["status"] == "die":
                        events_container_die += 1

                    if event["status"] == "oom":
                        events_container_oom += 1

                    if event["status"] == "stop":
                        events_container_stop += 1

                    if event["status"] == "kill":
                        events_container_kill += 1

                    if event["status"] == "destroy":
                        events_container_destroy += 1

                metrics = []
                clock = time.time()

                metrics.append(
                    pyzabbix.ZabbixMetric(
                        self._config.get("zabbix", "host"),
                        "docker.events[container,create]",
                        events_container_create,
                        clock))

                metrics.append(
                    pyzabbix.ZabbixMetric(
                        self._config.get("zabbix", "host"),
                        "docker.events[container,start]",
                        events_container_start,
                        clock))

                metrics.append(
                    pyzabbix.ZabbixMetric(
                        self._config.get("zabbix", "host"),
                        "docker.events[container,die]",
                        events_container_die,
                        clock))

                metrics.append(
                    pyzabbix.ZabbixMetric(
                        self._config.get("zabbix", "host"),
                        "docker.events[container,oom]",
                        events_container_oom,
                        clock))

                metrics.append(
                    pyzabbix.ZabbixMetric(
                        self._config.get("zabbix", "host"),
                        "docker.events[container,stop]",
                        events_container_stop,
                        clock))

                metrics.append(
                    pyzabbix.ZabbixMetric(
                        self._config.get("zabbix", "host"),
                        "docker.events[container,kill]",
                        events_container_kill,
                        clock))

                metrics.append(
                    pyzabbix.ZabbixMetric(
                        self._config.get("zabbix", "host"),
                        "docker.events[container,destroy]",
                        events_container_destroy,
                        clock))

                if len(metrics) > 0:
                    self._logger.debug("sending %d metrics" % len(metrics))
                    self._zabbix_sender.send(metrics)
            except (IOError, OSError):
                self._logger.error("failed to send events metrics")

                pass


class Application(object):
    """This class implements the application instance"""

    _instance = None
    _lock = threading.Lock()

    def __new__(cls):
        """Create the application instance singleton"""

        if Application._instance is None:
            with Application._lock:
                if Application._instance is None:
                    Application._instance = \
                        super(Application, cls).__new__(cls)

        return Application._instance

    def __init__(self):
        """Initialize the application instance"""

        self._logger = logging.getLogger(self.__class__.__name__)
        self._stop_event = threading.Event()
        self._config = None

    def run(self):
        """Start the application """

        parser = argparse.ArgumentParser(
            description="Discover and send docker metrics to zabbix server")
        parser.add_argument(
            "--file",
            help="configuration file to use",
            metavar="<FILE>"
        )
        parser.add_argument(
            "--host",
            help="host to use for sending zabbix metrics",
            metavar="<HOST>")
        parser.add_argument(
            "--rootfs",
            help="rootfs path for retrieving system metrics",
            metavar="PATH",)
        parser.add_argument(
            "--verbose",
            action="store_true",
            help="enable verbose output")
        parser.add_argument(
            "--version",
            action="version",
            version="zabbix-docker %s" % version.__version__)

        args = parser.parse_args()

        default_config = """\
        # zabbix-docker.conf

        [main]
        log = yes
        log_level = error
        rootfs = /
        containers = yes
        containers_stats = yes
        containers_top = no
        containers_remote = no
        events = yes

        [docker]
        base_url = unix:///var/run/docker.sock
        timeout = 5

        [zabbix]
        host =

        [discovery]
        startup = 15
        interval = 300
        poll_events = yes
        poll_events_interval = 15

        [containers]
        startup = 15
        interval = 60

        [containers_stats]
        startup = 30
        interval = 60
        workers = 10
        stats_cpus = no
        stats_memory = yes
        stats_networks = yes
        stats_devices = yes

        [containers_top]
        startup = 30
        interval = 60
        workers = 10

        [containers_remote]
        startup = 30
        interval = 60
        workers = 10
        path = /etc/zabbix/scripts/trapper
        delay = 1
        user = root
        trappers = yes
        trappers_timestamp = no

        [events]
        startup = 30
        interval = 60
        """

        self._config = configparser.ConfigParser()
        self._config.read_string(default_config)

        if "file" in args and args.file:
            self._config.read(args.file)
        else:
            self._config.read([
                '/etc/zabbix-docker/zabbix-docker.conf',
                os.path.expanduser('~/.zabbix-docker.conf')])

        if "rootfs" in args and args.rootfs:
            self._config.set("main", "rootfs", args.rootfs)

        if "host" in args and args.host:
            self._config.set("zabbix", "host", args.host)

        if self._config.get("zabbix", "host") == "":
            self._config.set("zabbix", "host", socket.gethostname())

        if not self._config.getboolean("main", "log") == "yes":
            if self._config.get("main", "log_level") == "error":
                level = logging.ERROR
            elif self._config.get("main", "log_level") == "warning":
                level = logging.WARN
            elif self._config.get("main", "log_level") == "info":
                level = logging.INFO
            elif self._config.get("main", "log_level") == "debug":
                level = logging.DEBUG
            else:
                level = logging.NOTSET

            logging.basicConfig(level=level)
            if level == logging.DEBUG:
                logging.getLogger("docker").setLevel(logging.INFO)
                logging.getLogger("pyzabbix").setLevel(logging.INFO)
                logging.getLogger("requests").setLevel(logging.WARNING)
                logging.getLogger("urllib3").setLevel(logging.WARNING)

        self._logger.info("starting application")

        self._logger.debug("registering signal handlers")
        signal.signal(signal.SIGINT, self.exit_handler)
        signal.signal(signal.SIGTERM, self.exit_handler)

        self._logger.debug("creating docker client")
        docker_client = docker.Client(
            base_url=self._config.get("docker", "base_url"),
            timeout=self._config.getint("docker", "timeout")
        )

        self._logger.debug("creating zabbix sender client")
        zabbix_sender = pyzabbix.ZabbixSender(use_config=True)

        self._logger.info("starting services")

        containers_discovery_service = DockerDiscoveryService(self._config, self._stop_event, docker_client,
                                                              zabbix_sender)
        containers_discovery_service.start()

        if self._config.getboolean("main", "containers"):
            containers_service = DockerContainersService(self._config, self._stop_event, docker_client, zabbix_sender)
            containers_service.start()

        if self._config.getboolean("main", "containers_stats"):
            containers_stats_service = DockerContainersStatsService(self._config, self._stop_event, docker_client,
                                                                    zabbix_sender)
            containers_stats_service.start()

        if self._config.getboolean("main", "containers_top"):
            containers_top_service = DockerContainersTopService(self._config, self._stop_event, docker_client,
                                                                zabbix_sender)
            containers_top_service.start()

        if self._config.getboolean("main", "containers_remote"):
            containers_remote_service = DockerContainersRemoteService(self._config, self._stop_event, docker_client,
                                                                      zabbix_sender)
            containers_remote_service.start()

        if self._config.getboolean("main", "events"):
            events_service = DockerEventsService(self._config, self._stop_event, docker_client, zabbix_sender,
                                                 containers_discovery_service)
            events_service.start()

        while not self._stop_event.isSet():
            self._logger.debug("waiting signal")
            signal.pause()
            self._logger.debug("signal received")

        self._logger.info("stopping application")

        sys.exit(0)

    def exit_handler(self, signum, frame):
        """Handle the request signal to exit the application"""

        self._logger.info("signal %d received, exiting" % signum)
        self._stop_event.set()


if __name__ == "__main__":
    app = Application()

    app.run()
