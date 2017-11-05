FROM bhuisgen/alpine-build:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=${PATH}:${JAVA_HOME}/bin

RUN apk add --update openjdk8 && \
    apk add --no-cache maven && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /
