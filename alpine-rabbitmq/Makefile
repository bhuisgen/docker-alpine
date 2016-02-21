# Makefile

IMAGE_NAME=bhuisgen/alpine-rabbitmq
CONTAINER_NAME=rabbitmq

.PHONY: all build clean start stop run

all: clean build

clean:
	(docker stop ${CONTAINER_NAME} || true) > /dev/null 2>&1
	(docker kill ${CONTAINER_NAME} || true) > /dev/null 2>&1
	(docker rm ${CONTAINER_NAME} || true) > /dev/null 2>&1
	(docker rmi ${IMAGE_NAME} || true) > /dev/null 2>&1

build:
	docker build -t ${IMAGE_NAME} .

run:
	docker run -d \
		-p 5672:5672 -p 15672:15672 -p 61613:61613 -p 1883:1883 \
		-e CONSUL_SERVER=172.17.0.1 \
		--cpu-shares 1024 -m 64M \
		--name ${CONTAINER_NAME} ${IMAGE_NAME}

start:
	docker start ${CONTAINER_NAME}

stop:
	docker stop ${CONTAINER_NAME}

rm:
	docker rm ${CONTAINER_NAME}

exec:
	docker exec -ti ${CONTAINER_NAME} /bin/sh
