#!/bin/sh
set -e

DOCKER_VOLUME=devcontainer_$(basename $(pwd))

docker volume inspect ${DOCKER_VOLUME} 1>/dev/null 2>&1 | \
   docker volume create ${DOCKER_VOLUME} 1>/dev/null 2>&1
