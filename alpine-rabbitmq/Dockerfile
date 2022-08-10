ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-rabbitmq" \
    org.label-schema.description="alpine-rabbitmq image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION"

ENV PATH=/usr/local/rabbitmq/sbin:$PATH

RUN mkdir -p /var/lib/rabbitmq && \
    addgroup -S rabbitmq && \
    adduser -S -D -g "" -G rabbitmq -s /sbin/nologin -h /var/lib/rabbitmq rabbitmq && \
    chown rabbitmq:rabbitmq /var/lib/rabbitmq && \
    chmod 700 /var/lib/rabbitmq

ADD https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.10.5/rabbitmq-server-generic-unix-3.10.5.tar.xz \
        /tmp/rabbitmq.tar.xz

RUN apk add --update --no-cache --progress erlang tar xz && \
    mkdir /usr/local/rabbitmq && \
    tar -xJf /tmp/rabbitmq.tar.xz -C /usr/local/rabbitmq --strip-components 1 && \
    rm /tmp/rabbitmq.tar.xz && \
    mkdir -p /var/lib/rabbitmq/config /var/lib/rabbitmq/mnesia /var/lib/rabbitmq/plugins \
        /var/lib/rabbitmq/schema /var/lib/rabbitmq/logs /var/lib/rabbitmq/hipe/ebin /var/run/rabbitmq && \
    chown rabbitmq:rabbitmq /var/lib/rabbitmq/config /var/lib/rabbitmq/mnesia /var/lib/rabbitmq/plugins \
        /var/lib/rabbitmq/schema /var/lib/rabbitmq/logs /var/lib/rabbitmq/hipe/ebin /var/run/rabbitmq \
        /var/run/rabbitmq && \
    apk del --purge tar xz

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 4369 25672 5672 5671 15672 1883 8883 61613 61614 15674 15675
VOLUME ["/var/lib/rabbitmq"]
