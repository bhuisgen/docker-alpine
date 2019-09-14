ARG TAG

FROM bhuisgen/alpine-build:${TAG:-latest}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update autoconf automake && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /
