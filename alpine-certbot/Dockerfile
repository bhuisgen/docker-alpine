FROM alpine:3.7
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update certbot openssl && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/usr/bin/certbot"]
CMD []

VOLUME ["/data"]
WORKDIR /data
