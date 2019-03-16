ARG TAG

FROM bhuisgen/alpine-backup:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update mongodb-tools && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /
