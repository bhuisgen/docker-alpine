FROM alpine:3.11

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-passbolt" \
      org.label-schema.description="alpine-passbolt image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV PASSBOLT_VERSION=1.6.5

RUN apk add --update curl tar && \
    mkdir /var/www && \
    curl -sSL https://github.com/passbolt/passbolt_api/archive/v${PASSBOLT_VERSION}.tar.gz | \
        tar -xzo -C /var/www --strip-components 1 && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
