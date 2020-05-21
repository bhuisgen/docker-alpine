ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV GRAFANA_VERSION=5.0.3

RUN mkdir /var/lib/grafana && \
    addgroup -S grafana && \
    adduser -S -D -g "" -G grafana -s /sbin/nologin -h /var/lib/grafana grafana

RUN apk add --update libc6-compat tar && \
    mkdir /usr/local/grafana && \
    curl -sSL https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-${GRAFANA_VERSION}.linux-x64.tar.gz | \
        tar -xzo -C /usr/local/grafana --strip-components 1 && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8888
