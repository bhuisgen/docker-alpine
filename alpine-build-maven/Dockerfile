FROM bhuisgen/alpine-build:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=${PATH}:${JAVA_HOME}/bin

RUN apk add --update openjdk8 && \
    apk add --update --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted maven && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /
