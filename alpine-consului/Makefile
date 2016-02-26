# Makefile

IMAGE_NAME=bhuisgen/alpine-consului
CONTAINER_NAME=consului

.PHONY: all build clean exec logs start stop run

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
		-p 443:443 \
		-e CONSUL_OPTIONS="-retry-join 172.17.0.1 -retry-interval 30s" \
		-e CONSULUI_USERNAME=consul \
		-e CONSULUI_PASSWORD=consul \
		--name ${CONTAINER_NAME} ${IMAGE_NAME}

start:
	docker start ${CONTAINER_NAME}

stop:
	docker stop ${CONTAINER_NAME}

rm:
	docker rm ${CONTAINER_NAME}

exec:
	docker exec -ti ${CONTAINER_NAME} /bin/sh

logs:
	docker logs ${CONTAINER_NAME}
