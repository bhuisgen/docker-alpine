FROM alpine:3.17

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

ADD https://github.com/drone/drone-cli/releases/download/v1.5.0/drone_linux_amd64.tar.gz /tmp/drone-cli.tar.gz

RUN apk add --update --no-cache --progress tar && \
    tar -xzf /tmp/drone-cli.tar.gz -C /usr/local/bin && \
    rm /tmp/drone-cli.tar.gz && \
    chmod +x /usr/local/bin/drone && \
    apk del tar

ENTRYPOINT ["/usr/local/bin/drone"]
CMD []
