FROM bhuisgen/alpine-build:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update make && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/usr/local/build/run.sh"]
CMD []

WORKDIR /usr/local/build
