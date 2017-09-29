FROM alpine:3.6
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update certbot && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["certbot"]
CMD []

VOLUME ["/data"]
WORKDIR /data
