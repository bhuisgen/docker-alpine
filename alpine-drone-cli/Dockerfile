FROM alpine:3.12

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-drone-cli" \
      org.label-schema.description="alpine-drone-cli image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV DRONECLI_VERSION=1.2.1

RUN apk add --update curl tar && \
    curl -sSL https://github.com/drone/drone-cli/releases/download/v${DRONECLI_VERSION}/drone_linux_amd64.tar.gz | \
        tar -xzo -C /usr/local/bin && \
    chmod +x /usr/local/bin/drone && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/drone"]
CMD []
