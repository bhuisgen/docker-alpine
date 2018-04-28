FROM alpine:3.7
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV DOCKERMACHINE_VERSION=0.14.0

RUN apk add --update curl tar && \
    curl -sSL https://github.com/docker/machine/releases/download/v${DOCKERMACHINE_VERSION}/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
    chmod +x /usr/local/bin/docker-machine && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/docker-machine"]
CMD []

VOLUME ["/data"]
WORKDIR /data
