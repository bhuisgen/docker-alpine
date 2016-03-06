# Makefile

DOCKER_IMAGE=bhuisgen/alpine-dnsmasq
DOCKER_REPOSITORY=127.0.0.1:5000
DOCKER_CONTAINER=dnsmasq

.PHONY: all build clean exec logs pull push run start stop

all: clean build

clean:
	(docker stop ${DOCKER_CONTAINER} || true) > /dev/null 2>&1
	(docker kill ${DOCKER_CONTAINER} || true) > /dev/null 2>&1
	(docker rm ${DOCKER_CONTAINER} || true) > /dev/null 2>&1
	(docker rmi ${DOCKER_IMAGE} || true) > /dev/null 2>&1

build:
	docker build -t ${DOCKER_IMAGE} .

pull:
	docker pull ${DOCKER_REPOSITORY}/${DOCKER_IMAGE}

push:
	docker push ${DOCKER_REPOSITORY}/${DOCKER_IMAGE}

run:
	docker run -d \
		-p 53:53 -p 53:53/udp -p 67:67/udp \
		--privileged --net host \
		-e DNSMASQ_INTERFACE=wlx74da386015cd \
		-e DNSMASQ_DHCPRANGE=192.168.100.10,192.168.100.20,255.255.255.0,12h \
		-e DNSMASQ_DHCPNETMASK=255.255.255.0 \
		-e DNSMASQ_DHCPROUTER=192.168.100.1 \
		-e DNSMASQ_DHCPNTPSERVER=192.168.100.1 \
		--name ${DOCKER_CONTAINER} ${DOCKER_IMAGE}

start:
	docker start ${DOCKER_CONTAINER}

stop:
	docker stop ${DOCKER_CONTAINER}

rm:
	docker rm ${DOCKER_CONTAINER}

exec:
	docker exec -ti ${DOCKER_CONTAINER} /bin/sh

logs:
	docker logs ${DOCKER_CONTAINER}
