ARG BASE
ARG TAG

FROM bhuisgen/alpine-build-rpi:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-build-rpi-python" \
    org.label-schema.description="alpine-build-rpi-python image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"


RUN apk add --update --no-cache --progress python3 python3-dev py3-pip && \
    python3 -m ensurepip --upgrade && \
    pip3 install -U pip setuptools setuptools_git setuptools_lint setuptools_pep8 wheel

COPY rootfs/ /
