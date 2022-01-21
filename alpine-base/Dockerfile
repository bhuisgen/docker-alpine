FROM alpine:3.15

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-base" \
      org.label-schema.description="alpine-base image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0" \
      fr.hbis.docker.base.build-date="$BUILD_DATE" \
      fr.hbis.docker.base.name="alpine-base" \
      fr.hbis.docker.base.vendor="Boris HUISGEN" \
      fr.hbis.docker.base.version="$BUILD_VERSION"

ENV S6OVERLAY_VERSION=2.2.0.3 \
    S6_BEHAVIOUR_IF_STAGE2_FAILS=1

RUN apk update && \
    apk upgrade && \
    apk add bash bind-tools ca-certificates curl jq tar && \
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/v${S6OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | \
        tar xz -C / && \
    apk del tar && \
    rm -rf /var/cache/apk/*
