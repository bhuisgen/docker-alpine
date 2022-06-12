ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV RABBITMQ_VERSION=3.10.5 \
    PATH=/usr/local/rabbitmq/sbin:$PATH

RUN mkdir -p /var/lib/rabbitmq && \
    addgroup -S rabbitmq && \
    adduser -S -D -g "" -G rabbitmq -s /bin/sh -h /var/lib/rabbitmq rabbitmq && \
    chown rabbitmq:rabbitmq /var/lib/rabbitmq

RUN apk add --update erlang tar xz && \
    mkdir /usr/local/rabbitmq && \
    curl -sSL https://github.com/rabbitmq/rabbitmq-server/releases/download/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz | \
    tar -xJo -C /usr/local/rabbitmq --strip-components 1 && \
    mkdir -p /var/lib/rabbitmq/config /var/lib/rabbitmq/mnesia /var/lib/rabbitmq/plugins \
    /var/lib/rabbitmq/schema /var/lib/rabbitmq/logs /var/lib/rabbitmq/hipe/ebin /var/run/rabbitmq && \
    chown rabbitmq:rabbitmq /var/lib/rabbitmq/config /var/lib/rabbitmq/mnesia /var/lib/rabbitmq/plugins \
    /var/lib/rabbitmq/schema /var/lib/rabbitmq/logs /var/lib/rabbitmq/hipe/ebin /var/run/rabbitmq \
    /var/run/rabbitmq && \
    apk del --purge tar xz && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 4369 25672 5672 5671 15672 1883 8883 61613 61614 15674 15675
VOLUME ["/var/lib/rabbitmq"]
