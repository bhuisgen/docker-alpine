ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV TELEGRAF_VERSION=1.15.2

RUN mkdir /var/lib/telegraf && \
    addgroup -S telegraf && \
    adduser -S -D -g "" -G telegraf -s /sbin/nologin -h /var/lib/telegraf telegraf

RUN apk add --no-cache --update libc6-compat tar && \
    mkdir /usr/local/telegraf && \
    curl -sSL https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_linux_amd64.tar.gz | \
        tar -xzo -C /usr/local/telegraf --strip-components 2 && \
    apk del tar

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

VOLUME ["/var/lib/telegraf"]
