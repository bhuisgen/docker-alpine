FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV ERLANG_VERSION=18.1-r5 \
    RABBITMQ_VERSION=3.6.1 \
    RABBITMQ_MNESIA_DIR=/var/lib/rabbitmq/mnesia \
    RABBITMQ_PLUGINS_EXPAND_DIR=/var/lib/rabbitmq/plugins \
    RABBITMQ_PID_FILE=/var/run/rabbitmq/rabbitmq.pid \
    RABBITMQ_LOGS=- \
    RABBITMQ_SASL_LOGS=/dev/null \
    PATH=/usr/local/rabbitmq/sbin:$PATH

RUN apk add --update tar xz \
        erlang=${ERLANG_VERSION} \
        erlang-asn1=${ERLANG_VERSION} \
        erlang-crypto=${ERLANG_VERSION} \
        erlang-diameter=${ERLANG_VERSION} \
        erlang-edoc=${ERLANG_VERSION} \
        erlang-eldap=${ERLANG_VERSION} \
        erlang-eunit=${ERLANG_VERSION} \
        erlang-hipe=${ERLANG_VERSION} \
        erlang-ic=${ERLANG_VERSION} \
        erlang-inets=${ERLANG_VERSION} \
        erlang-mnesia=${ERLANG_VERSION} \
        erlang-odbc=${ERLANG_VERSION} \
        erlang-os-mon=${ERLANG_VERSION} \
        erlang-parsetools=${ERLANG_VERSION} \
        erlang-percept=${ERLANG_VERSION} \
        erlang-public-key=${ERLANG_VERSION} \
        erlang-runtime-tools=${ERLANG_VERSION} \
        erlang-ssh=${ERLANG_VERSION} \
        erlang-ssl=${ERLANG_VERSION} \
        erlang-sasl=${ERLANG_VERSION} \
        erlang-snmp=${ERLANG_VERSION} \
        erlang-syntax-tools=${ERLANG_VERSION} \
        erlang-tools=${ERLANG_VERSION} \
        erlang-webtool=${ERLANG_VERSION} \
        erlang-xmerl=${ERLANG_VERSION} && \
    mkdir -p /usr/local/rabbitmq && \
    curl -sSL https://www.rabbitmq.com/releases/rabbitmq-server/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz | tar -xJ -C /usr/local/rabbitmq --strip-components 1 && \
    mkdir -p /var/lib/rabbitmq/mnesia /var/lib/rabbitmq/plugins /var/log/rabbitmq /var/run/rabbitmq && \
    addgroup rabbitmq && \
    adduser -S -D -g "" -G rabbitmq -s /bin/sh -h /var/lib/rabbitmq rabbitmq && \
    chown -R rabbitmq:rabbitmq /usr/local/rabbitmq /var/lib/rabbitmq /var/log/rabbitmq /var/run/rabbitmq && \
    apk del --purge tar xz && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 4369 25672 5672 5671 15672 61613 61614 1883 8883
VOLUME ["/var/lib/rabbitmq"]
