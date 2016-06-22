#!/usr/bin/with-contenv sh

/usr/bin/timeout -s ${BUILD_TIMEOUT} /bin/sh ${BUILD_SCRIPT}
