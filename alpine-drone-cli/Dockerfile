FROM alpine:3.7
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV DRONECLI_VERSION=0.8.5

RUN apk add --update curl tar && \
    curl -sSL https://github.com/drone/drone-cli/releases/download/v${DRONECLI_VERSION}/drone_linux_amd64.tar.gz | \
        tar -xzo -C /usr/local/bin && \
    chmod +x /usr/local/bin/drone && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["drone"]
CMD []
