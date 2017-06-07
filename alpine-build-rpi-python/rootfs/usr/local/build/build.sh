#!/usr/bin/env bash

trap 'exit 2' ERR INT TERM

if [ -z "${SETUP_COMMANDS}" ]; then
    SETUP_COMMANDS="build"
fi

python setup.py ${SETUP_COMMANDS}
