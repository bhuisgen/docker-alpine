FROM bhuisgen/alpine-build-rpi:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN [ "cross-build-start" ]

RUN apk add --update make && \
    rm -rf /var/cache/apk/*

RUN [ "cross-build-end" ]

COPY rootfs/ /
