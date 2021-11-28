ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV KAPACITOR_VERSION=1.5.6

RUN mkdir /var/lib/kapacitor && \
    addgroup -S kapacitor && \
    adduser -S -D -g "" -G kapacitor -s /sbin/nologin -h /var/lib/kapacitor kapacitor

RUN apk add --update libc6-compat tar && \
    mkdir /usr/local/kapacitor /var/log/kapacitor && \
    curl -sSL https://dl.influxdata.com/kapacitor/releases/kapacitor-${KAPACITOR_VERSION}_linux_amd64.tar.gz | \
        tar -xzo -C /usr/local/kapacitor --strip-components 2 && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 9092
VOLUME ["/var/lib/kapacitor"]
