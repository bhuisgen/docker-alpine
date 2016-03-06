# Makefile

DOCKER_IMAGE=bhuisgen/alpine-redis
DOCKER_REPOSITORY=127.0.0.1:5000
DOCKER_CONTAINER=redis

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
		--link consul:consul \
		-e CONSUL_ENABLE=1 \
		-e CONSUL_OPTIONS="-retry-join 172.17.0.1 -retry-interval 30s" \
		-p 6379:6379 \
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
