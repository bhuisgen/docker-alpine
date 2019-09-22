ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV TELEGRAF_VERSION=1.12.0

RUN mkdir /var/lib/telegraf && \
    addgroup -S telegraf && \
    adduser -S -D -g "" -G telegraf -s /sbin/nologin -h /var/lib/telegraf telegraf

RUN apk add --update libc6-compat tar && \
    mkdir /usr/local/telegraf && \
    curl -sSL https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_linux_amd64.tar.gz | \
        tar -xzo -C /usr/local/telegraf --strip-components 2 && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

VOLUME ["/var/lib/telegraf"]
