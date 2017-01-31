#!/usr/bin/env bash

trap 'exit 2' ERR INT TERM

if [ -z "${MVN_GOAL}" ]; then
    MVN_GOAL="test"
fi

mvn -B ${MVN_OPTIONS} ${MVN_GOAL}
