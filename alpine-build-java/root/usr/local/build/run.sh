#!/bin/sh

set -e

if [ -z ${BUILD_REPOSITORY} ]; then
    echo "BUILD_REPOSITORY is not set, aborting"

    exit 1
fi

if [ -z ${BUILD_REFNAME} ]; then
    echo "BUILD_REFNAME is not set, aborting"

    exit 1
fi

if [ -z ${BUILD_REF} ]; then
    echo "BUILD_REF is not set, aborting"

    exit 1
fi

git clone ${BUILD_REPOSITORY} -b ${BUILD_REFNAME} --progress project
cd project
git checkout ${BUILD_REF}

mvn package -B

exit 0
