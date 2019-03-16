ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV RABBITMQ_VERSION=3.7.4 \
    PATH=/usr/local/rabbitmq/sbin:$PATH

RUN mkdir -p /var/lib/rabbitmq && \
    addgroup -S rabbitmq && \
    adduser -S -D -g "" -G rabbitmq -s /bin/sh -h /var/lib/rabbitmq rabbitmq && \
    chown rabbitmq:rabbitmq /var/lib/rabbitmq

COPY packages/*.apk /root/
RUN apk add --update tar xz && \
    apk add --allow-untrusted \
        /root/erlang-20.1.7-r2.apk \
        /root/erlang-asn1-20.1.7-r2.apk \
        /root/erlang-compiler-20.1.7-r2.apk \
        /root/erlang-crypto-20.1.7-r2.apk \
        /root/erlang-eldap-20.1.7-r2.apk \
        /root/erlang-hipe-20.1.7-r2.apk \
        /root/erlang-inets-20.1.7-r2.apk \
        /root/erlang-kernel-20.1.7-r2.apk \
        /root/erlang-mnesia-20.1.7-r2.apk \
        /root/erlang-os-mon-20.1.7-r2.apk \
        /root/erlang-public-key-20.1.7-r2.apk \
        /root/erlang-sasl-20.1.7-r2.apk \
        /root/erlang-ssl-20.1.7-r2.apk \
        /root/erlang-stdlib-20.1.7-r2.apk \
        /root/erlang-syntax-tools-20.1.7-r2.apk \
        /root/erlang-xmerl-20.1.7-r2.apk && \
    mkdir /usr/local/rabbitmq && \
    curl -sSL https://github.com/rabbitmq/rabbitmq-server/releases/download/v${RABBITMQ_VERSION}/rabbitmq-server-generic-unix-${RABBITMQ_VERSION}.tar.xz | \
        tar -xJo -C /usr/local/rabbitmq --strip-components 1 && \
    mkdir -p /var/lib/rabbitmq/config /var/lib/rabbitmq/mnesia /var/lib/rabbitmq/plugins \
        /var/lib/rabbitmq/schema /var/lib/rabbitmq/logs /var/lib/rabbitmq/hipe/ebin /var/run/rabbitmq && \
    chown rabbitmq:rabbitmq /var/lib/rabbitmq/config /var/lib/rabbitmq/mnesia /var/lib/rabbitmq/plugins \
        /var/lib/rabbitmq/schema /var/lib/rabbitmq/logs /var/lib/rabbitmq/hipe/ebin /var/run/rabbitmq \
        /var/run/rabbitmq && \
    apk del --purge tar xz && \
    rm -f /root/*.apk && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 4369 25672 5672 5671 15672 1883 8883 61613 61614 15674 15675
VOLUME ["/var/lib/rabbitmq"]
