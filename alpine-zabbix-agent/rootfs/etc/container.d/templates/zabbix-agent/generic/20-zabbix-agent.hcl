template {
  source      = "/etc/container.d/templates/zabbix-agent/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/10-zabbix-agent"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/zabbix-agent/generic/zabbix_agentd.conf.ctmpl"
  destination = "/etc/zabbix/zabbix_agentd.conf"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/zabbix-agent/generic/zabbix-docker.conf.ctmpl"
  destination = "/etc/zabbix-docker/zabbix-docker.conf"
  perms       = 0644
}
