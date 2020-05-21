FROM alpine:3.11

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-rabbitmqadmin" \
      org.label-schema.description="alpine-rabbitmqadmin image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV RABBITMQ_VERSION=3.8.3

RUN apk add --update bash bind-tools ca-certificates curl jq python2 tar && \
    python -m ensurepip --upgrade && \
    curl -sSL https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/rabbitmq_v$(echo "${RABBITMQ_VERSION}"|tr '.' '_')/bin/rabbitmqadmin \
        -o /usr/local/bin/rabbitmqadmin && \
    chmod +x /usr/local/bin/rabbitmqadmin && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/rabbitmqadmin"]
CMD []

VOLUME ["/data"]
WORKDIR /data
