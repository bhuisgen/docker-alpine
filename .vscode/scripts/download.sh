#!/bin/sh
set -e

DOCKER_VOLUME=devcontainer_$(basename $(pwd))

id=$(docker run -d --rm -v ${DOCKER_VOLUME}:/data alpine:3.15 /bin/sh -c 'sleep 3600')
docker cp ${id}:/data/. ./.
docker kill ${id} >/dev/null 2>/dev/null
