#!/usr/bin/with-contenv sh

if [ -z ${BUILD_TIMEOUT} ] || [ ${BUILD_TIMEOUT} -eq 0 ]; then
    /bin/bash ${BUILD_SCRIPT}
else
    /usr/bin/timeout -t ${BUILD_TIMEOUT} /bin/bash ${BUILD_SCRIPT}
fi
