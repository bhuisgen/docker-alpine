ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV GRAFANA_VERSION=8.2.5

RUN mkdir /var/lib/grafana && \
    addgroup -S grafana && \
    adduser -S -D -g "" -G grafana -s /sbin/nologin -h /var/lib/grafana grafana

RUN apk add --update libc6-compat tar && \
    mkdir /usr/local/grafana && \
    curl -sSL https://dl.grafana.com/oss/release/grafana-${GRAFANA_VERSION}.linux-amd64.tar.gz | \
        tar -xzo -C /usr/local/grafana --strip-components 1 && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8888
