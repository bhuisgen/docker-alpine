FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV RABBITMQ_VERSION=3.6.6

RUN apk add --update python2 && \
    python -m ensurepip --upgrade && \
    curl -sSL https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/rabbitmq_v$(echo "${RABBITMQ_VERSION}"|tr '.' '_')/bin/rabbitmqadmin -o /usr/local/bin/rabbitmqadmin && \
    chmod +x /usr/local/bin/rabbitmqadmin && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["rabbitmqadmin"]
CMD []

VOLUME ["/data"]
WORKDIR /data
