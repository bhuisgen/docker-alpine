ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV CHRONOGRAF_VERSION=1.4.2.3

RUN mkdir /var/lib/chronograf && \
    addgroup -S chronograf && \
    adduser -S -D -g "" -G chronograf -s /sbin/nologin -h /var/lib/chronograf chronograf

RUN apk add --update libc6-compat tar && \
    mkdir /usr/local/chronograf && \
    curl -sSL https://dl.influxdata.com/chronograf/releases/chronograf-${CHRONOGRAF_VERSION}_linux_amd64.tar.gz | \
        tar -xzo -C /usr/local/chronograf --strip-components 2 && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8888
VOLUME ["/var/lib/chronograf"]
