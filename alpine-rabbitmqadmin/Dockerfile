FROM alpine:3.7
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV RABBITMQ_VERSION=3.6.8

RUN apk add --update bash bind-tools ca-certificates curl jq python2 tar && \
    python -m ensurepip --upgrade && \
    curl -sSL https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/rabbitmq_v$(echo "${RABBITMQ_VERSION}"|tr '.' '_')/bin/rabbitmqadmin -o /usr/local/bin/rabbitmqadmin && \
    chmod +x /usr/local/bin/rabbitmqadmin && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["rabbitmqadmin"]
CMD []

VOLUME ["/data"]
WORKDIR /data
