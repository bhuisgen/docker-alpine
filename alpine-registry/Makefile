# Makefile

IMAGE_NAME=bhuisgen/alpine-registry
CONTAINER_NAME=registry

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
		-p 8080:8080 \
		-e CONSUL_SERVER=172.17.0.1 \
		--name ${CONTAINER_NAME} ${IMAGE_NAME}

start:
	docker start ${CONTAINER_NAME}

stop:
	docker stop ${CONTAINER_NAME}

rm:
	docker rm ${CONTAINER_NAME}

exec:
	docker exec -ti ${CONTAINER_NAME} /bin/sh
