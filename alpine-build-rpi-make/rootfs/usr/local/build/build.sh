#!/usr/bin/env bash

trap 'exit 2' ERR INT TERM

if [ -z "${CONFIGURE}" ]; then
    CONFIGURE=1
fi

if [ -z "${MAKE_INSTALL}" ]; then
    MAKE_INSTALL=1
fi

if [ ! -z "${CONFIGURE}" ] && [ "${CONFIGURE}" -eq 1 ]; then
    if [ -x configure ]; then
        ./configure ${CONFIGURE_OPTIONS}
    fi
fi

make ${MAKE_OPTIONS} ${MAKE_TARGET} ${MAKE_TARGETOPTIONS}

if [ ! -z "${MAKE_INSTALL}" ] && [ "${MAKE_INSTALL}" -eq 1 ]; then
    make ${MAKE_OPTIONS} install ${MAKE_INSTALLOPTIONS}
fi
