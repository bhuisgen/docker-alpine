# Makefile

IMAGE_NAME="bhuisgen/alpine-consul"
CONTAINER_NAME="consul"

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
		-p 8300:8300 -p 8301:8301 -p 8301:8301/udp -p 8302:8302 -p 8302:8302/udp -p 8500:8500 -p 8600:8600 -p 8600:8600/udp \
		--name ${CONTAINER_NAME} ${IMAGE_NAME}

start:
	docker start ${CONTAINER_NAME}

stop:
	docker stop ${CONTAINER_NAME}

rm:
	docker rm ${CONTAINER_NAME}

exec:
	docker exec -ti ${CONTAINER_NAME} /bin/sh
