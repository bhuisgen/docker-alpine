FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV RABBITMQ_VERSION=3.6.5 \
    RABBITMQ_MNESIA_DIR=/var/lib/rabbitmq/mnesia \
    RABBITMQ_PLUGINS_EXPAND_DIR=/var/lib/rabbitmq/plugins \
    RABBITMQ_PID_FILE=/var/run/rabbitmq/rabbitmq.pid \
    RABBITMQ_LOGS=- \
    RABBITMQ_SASL_LOGS=- \
    PATH=/usr/local/rabbitmq/sbin:$PATH

RUN mkdir -p /var/lib/rabbitmq/mnesia /var/lib/rabbitmq/plugins /var/lib/rabbitmq/logs /var/run/rabbitmq && \
    addgroup rabbitmq && \
    adduser -S -D -g "" -G rabbitmq -s /bin/sh -h /var/lib/rabbitmq rabbitmq && \
    chown -R rabbitmq:rabbitmq /var/lib/rabbitmq /var/run/rabbitmq

RUN apk add --update tar xz && \
    apk add --update --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted \
        erlang \
        erlang-asn1 \
        erlang-crypto \
        erlang-eldap \
        erlang-inets \
        erlang-mnesia \
        erlang-os-mon \
        erlang-public-key \
        erlang-sasl \
        erlang-ssl \
        erlang-syntax-tools \
        erlang-xmerl && \
    mkdir -p /usr/local/rabbitmq && \
    curl -sSL https://www.rabbitmq.com/releases/rabbitmq-server/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz | tar -xJo -C /usr/local/rabbitmq --strip-components 1 && \
    apk del --purge tar xz && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 4369 25672 5672 5671 15672 1883 8883 61613 61614
VOLUME ["/var/lib/rabbitmq"]
