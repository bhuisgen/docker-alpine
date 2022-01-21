FROM alpine:3.15

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-hugo" \
      org.label-schema.description="alpine-hugo image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV HUGO_VERSION=0.89.4

RUN apk add --update curl libc6-compat libstdc++ tar && \
    mkdir /usr/local/hugo && \
    curl -sSL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz | \
        tar -xzo -C /usr/local/bin && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/hugo"]
CMD []

EXPOSE 1313
