ARG TAG

FROM bhuisgen/alpine-build:${TAG:-latest}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=${PATH}:${JAVA_HOME}/bin

RUN apk add --update maven openjdk8 && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /
