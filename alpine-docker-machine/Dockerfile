FROM alpine:3.12

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-docker-machine" \
      org.label-schema.description="alpine-docker-machine image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV DOCKERMACHINE_VERSION=0.16.0

RUN apk add --update curl tar && \
    curl -sSL https://github.com/docker/machine/releases/download/v${DOCKERMACHINE_VERSION}/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
    chmod +x /usr/local/bin/docker-machine && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/docker-machine"]
CMD []

VOLUME ["/data"]
WORKDIR /data
