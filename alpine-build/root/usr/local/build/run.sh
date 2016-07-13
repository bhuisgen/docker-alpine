#!/usr/bin/with-contenv bash

trap 'exit 2' ERR INT TERM

if [ -z ${BUILD_TIMEOUT} ] || [ ${BUILD_TIMEOUT} -eq 0 ]; then
    /bin/bash ${BUILD_SCRIPT}
else
    /usr/bin/timeout -t ${BUILD_TIMEOUT} /bin/bash ${BUILD_SCRIPT}
fi
