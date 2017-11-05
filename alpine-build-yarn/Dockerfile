FROM bhuisgen/alpine-build:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --no-cache nodejs yarn && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /
