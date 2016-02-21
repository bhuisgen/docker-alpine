# Makefile

IMAGE_NAME=bhuisgen/alpine-mariadb
CONTAINER_NAME=mariadb

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
		-p 3306:3306 \
		-e CONSUL_SERVER=172.17.0.1 \
		-e MARIADB_HOSTNAME=172.17.0.1 \
		-e MARIADB_DATABASE=alpine \
		-e MARIADB_USERNAME=alpine \
		-e MARIADB_PASSWORD=alpine \
		--name ${CONTAINER_NAME} ${IMAGE_NAME}

start:
	docker start ${CONTAINER_NAME}

stop:
	docker stop ${CONTAINER_NAME}

rm:
	docker rm ${CONTAINER_NAME}

exec:
	docker exec -ti ${CONTAINER_NAME} /bin/sh
