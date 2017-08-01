FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV RABBITMQ_VERSION=3.6.10 \
    RABBITMQ_HOME=/var/lib/rabbitmq \
    RABBITMQ_MNESIA_DIR=/var/lib/rabbitmq/mnesia \
    RABBITMQ_PLUGINS_EXPAND_DIR=/var/lib/rabbitmq/plugins \
    RABBITMQ_SERVER_CODE_PATH=/var/lib/rabbitmq/hipe/ebin \
    RABBITMQ_PID_FILE=/var/run/rabbitmq/rabbitmq.pid \
    RABBITMQ_LOGS=- \
    RABBITMQ_SASL_LOGS=- \
    PATH=/usr/local/rabbitmq/sbin:$PATH

RUN mkdir -p ${RABBITMQ_HOME} ${RABBITMQ_MNESIA_DIR} ${RABBITMQ_PLUGINS_EXPAND_DIR} ${RABBITMQ_SERVER_CODE_PATH} \
        /var/run/rabbitmq && \
    addgroup -S rabbitmq && \
    adduser -S -D -g "" -G rabbitmq -s /bin/sh -h ${RABBITMQ_HOME} rabbitmq && \
    chown -R rabbitmq:rabbitmq ${RABBITMQ_HOME} /var/run/rabbitmq

COPY packages/*.apk /root/
RUN apk add --update tar xz && \
    apk add --update --allow-untrusted \
        /root/erlang-19.3.0-r0.apk \
        /root/erlang-asn1-19.3.0-r0.apk \
        /root/erlang-compiler-19.3.0-r0.apk \
        /root/erlang-crypto-19.3.0-r0.apk \
        /root/erlang-eldap-19.3.0-r0.apk \
        /root/erlang-hipe-19.3.0-r0.apk \
        /root/erlang-inets-19.3.0-r0.apk \
        /root/erlang-kernel-19.3.0-r0.apk \
        /root/erlang-mnesia-19.3.0-r0.apk \
        /root/erlang-os-mon-19.3.0-r0.apk \
        /root/erlang-public-key-19.3.0-r0.apk \
        /root/erlang-sasl-19.3.0-r0.apk \
        /root/erlang-ssl-19.3.0-r0.apk \
        /root/erlang-stdlib-19.3.0-r0.apk \
        /root/erlang-syntax-tools-19.3.0-r0.apk \
        /root/erlang-xmerl-19.3.0-r0.apk && \
    mkdir -p /usr/local/rabbitmq && \
    curl -sSL https://www.rabbitmq.com/releases/rabbitmq-server/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz | tar -xJo -C /usr/local/rabbitmq --strip-components 1 && \
    apk del --purge tar xz && \
    rm -f /root/*.apk && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 4369 25672 5672 5671 15672 1883 8883 61613 61614 15674 15675
VOLUME ["/var/lib/rabbitmq"]
