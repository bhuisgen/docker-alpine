FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV RABBITMQ_VERSION=3.6.8 \
    RABBITMQ_HOME=/var/lib/rabbitmq \
    RABBITMQ_MNESIA_DIR=/var/lib/rabbitmq/mnesia \
    RABBITMQ_PLUGINS_EXPAND_DIR=/var/lib/rabbitmq/plugins \
    RABBITMQ_PID_FILE=/var/run/rabbitmq/rabbitmq.pid \
    RABBITMQ_LOGS=- \
    RABBITMQ_SASL_LOGS=- \
    PATH=/usr/local/rabbitmq/sbin:$PATH

RUN mkdir -p /var/lib/rabbitmq /var/lib/rabbitmq/mnesia /var/lib/rabbitmq/plugins /var/lib/rabbitmq/logs /var/run/rabbitmq && \
    addgroup rabbitmq && \
    adduser -S -D -g "" -G rabbitmq -s /bin/sh -h /var/lib/rabbitmq rabbitmq && \
    chown -R rabbitmq:rabbitmq /var/lib/rabbitmq /var/run/rabbitmq

COPY packages/*.apk /root/
RUN apk add --update tar xz && \
    mkdir -p /usr/local/rabbitmq && \
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
    curl -sSL https://www.rabbitmq.com/releases/rabbitmq-server/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz | tar -xJo -C /usr/local/rabbitmq --strip-components 1 && \
    apk del --purge tar xz \
    rm -f /root/*.apk && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 4369 25672 5672 5671 15672 1883 8883 61613 61614 15674
VOLUME ["/var/lib/rabbitmq"]
