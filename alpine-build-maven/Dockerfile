FROM bhuisgen/alpine-build:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=${PATH}:${JAVA_HOME}/bin

RUN apk add --update openjdk8 && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ maven && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /
