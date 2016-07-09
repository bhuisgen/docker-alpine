#!/bin/bash

trap 'exit 2' ERR INT TERM

if [ -z ${GIT_URL} ]; then
    echo "GIT_URL is not set, aborting"
    exit 1
fi

if [ -z ${GIT_REF} ]; then
    echo "GIT_REF is not set, aborting"
    exit 1
fi

if [ -z ${MVN_GOAL} ]; then
    MVN_GOAL="test"
fi

git clone ${GIT_URL} --progress project
cd project
git checkout -q ${GIT_REF}

mvn -B ${MVN_OPTIONS} ${MVN_GOAL}
