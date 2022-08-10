ARG BASE
ARG TAG

FROM bhuisgen/alpine-base-consul:prod
LABEL maintainer="bhuisgen@hbis.fr"

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-geth" \
      org.label-schema.description="alpine-geth image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

RUN mkdir /var/lib/geth && \
    addgroup -S geth && \
    adduser -S -D -g "" -G geth -s /sbin/nologin -h /var/lib/geth geth

RUN apk add --update geth && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []
