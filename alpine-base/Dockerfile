FROM alpine:3.15

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-base" \
    org.label-schema.description="alpine-base image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0" \
    fr.hbis.docker.base.build-date="$BUILD_DATE" \
    fr.hbis.docker.base.name="alpine-base" \
    fr.hbis.docker.base.vendor="Boris HUISGEN" \
    fr.hbis.docker.base.version="$BUILD_VERSION"

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=1

ADD https://github.com/just-containers/s6-overlay/releases/download/v3.1.0.1/s6-overlay-noarch.tar.xz /tmp
ADD https://github.com/just-containers/s6-overlay/releases/download/v3.1.0.1/s6-overlay-x86_64.tar.xz /tmp

RUN apk update && \
    apk upgrade && \
    apk add --no-cache --update --progress bash bind-tools ca-certificates curl jq tar xz && \
    tar xJpf /tmp/s6-overlay-noarch.tar.xz -C / && \
    tar xJpf /tmp/s6-overlay-x86_64.tar.xz -C / && \
    rm -fr /tmp/s6-overlay-noarch.tar.xz /tmp/s6-overlay-x86_64.tar.xz && \
    apk del tar xz && \
    rm -rf /var/cache/apk/*
