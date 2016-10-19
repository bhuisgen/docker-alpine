FROM bhuisgen/alpine-build:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update make && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/bin/sh"]
CMD []

WORKDIR /usr/local/build
