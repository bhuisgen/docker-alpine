FROM alpine:3.10
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV RABBITMQ_VERSION=3.7.3

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
