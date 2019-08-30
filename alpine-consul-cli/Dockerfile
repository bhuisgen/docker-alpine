FROM alpine:3.9
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV CONSULCLI_VERSION=0.3.1

RUN apk add --update curl tar && \
    curl -sSL https://github.com/mantl/consul-cli/releases/download/v${CONSULCLI_VERSION}/consul-cli_${CONSULCLI_VERSION}_linux_amd64.tar.gz | \
        tar -xzo -C /usr/local/bin --strip-components 1 && \
    chmod +x /usr/local/bin/consul-cli && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/consul-cli"]
CMD []
