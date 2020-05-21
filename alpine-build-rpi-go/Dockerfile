ARG TAG

FROM bhuisgen/alpine-build-rpi:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

RUN apk add --update go && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /
