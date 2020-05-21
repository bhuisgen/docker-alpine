FROM alpine:3.11

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-consul-cli" \
      org.label-schema.description="alpine-consul-cli image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV CONSULCLI_VERSION=0.3.1

RUN apk add --update curl tar && \
    curl -sSL https://github.com/mantl/consul-cli/releases/download/v${CONSULCLI_VERSION}/consul-cli_${CONSULCLI_VERSION}_linux_amd64.tar.gz | \
        tar -xzo -C /usr/local/bin --strip-components 1 && \
    chmod +x /usr/local/bin/consul-cli && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/consul-cli"]
CMD []
