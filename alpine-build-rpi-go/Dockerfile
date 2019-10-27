ARG TAG

FROM bhuisgen/alpine-build-rpi:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update go && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /
