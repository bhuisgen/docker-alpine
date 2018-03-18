#!/usr/bin/env bash

trap 'exit 2' ERR INT TERM

if [ -z "${YARN_COMMAND}" ]; then
    YARN_COMMAND="test"
fi

yarn install
yarn run ${YARN_COMMAND}
