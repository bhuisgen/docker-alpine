FROM alpine:3.17

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

ADD https://github.com/mantl/consul-cli/releases/download/v0.3.1/consul-cli_0.3.1_linux_amd64.tar.gz \
        /tmp/consul-cli.tar.gz

RUN apk add --update --no-cache --progress tar && \
    tar -xzf /tmp/consul-cli.tar.gz -C /usr/local/bin --strip-components 1 && \
    rm /tmp/consul-cli.tar.gz && \
    chmod +x /usr/local/bin/consul-cli && \
    apk del tar

ENTRYPOINT ["/usr/local/bin/consul-cli"]
CMD []
