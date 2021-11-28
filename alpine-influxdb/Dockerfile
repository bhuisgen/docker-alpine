ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV INFLUXDB_VERSION=1.8.1

RUN mkdir /var/lib/influxdb && \
    addgroup -S influxdb && \
    adduser -S -D -g "" -G influxdb -s /sbin/nologin -h /var/lib/influxdb influxdb

RUN apk add --update libc6-compat tar && \
    mkdir /usr/local/influxdb && \
    curl -sSL https://dl.influxdata.com/influxdb/releases/influxdb-${INFLUXDB_VERSION}_linux_amd64.tar.gz | \
        tar -xzo -C /usr/local/influxdb --strip-components 2 && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8086
VOLUME ["/var/lib/influxdb"]
