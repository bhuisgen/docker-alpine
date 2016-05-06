FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV ERLANG_VERSION=18.1-r5 \
    RABBITMQ_VERSION=3.6.1 \
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
    mkdir /usr/local/rabbitmq && \
    cd /usr/local/rabbitmq && \
    curl -sSL https://www.rabbitmq.com/releases/rabbitmq-server/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz -o rabbitmq.tar.xz && \
    tar xf rabbitmq.tar.xz --strip-components=1 && \
    rm rabbitmq.tar.xz && \
    rabbitmq-plugins enable --offline rabbitmq_event_exchange && \
    rabbitmq-plugins enable --offline rabbitmq_management && \
    rabbitmq-plugins enable --offline rabbitmq_mqtt && \
    rabbitmq-plugins enable --offline rabbitmq_stomp && \
    apk del --purge tar xz && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 4369 5672 15672 61613 1883
