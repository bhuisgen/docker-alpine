#!/usr/bin/with-contenv sh

/usr/bin/timeout -t ${BUILD_TIMEOUT} /bin/bash ${BUILD_SCRIPT}
