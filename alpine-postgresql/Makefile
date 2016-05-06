# Makefile

DOCKER_IMAGE=bhuisgen/alpine-postgresql
DOCKER_REPOSITORY=127.0.0.1:5000

.PHONY: all build clean pull push

all: clean build

clean:
	(docker rmi ${DOCKER_IMAGE} || true) > /dev/null 2>&1

build:
	docker build -t ${DOCKER_IMAGE} .

pull:
	docker pull ${DOCKER_REPOSITORY}/${DOCKER_IMAGE}

push:
	docker push ${DOCKER_REPOSITORY}/${DOCKER_IMAGE}
