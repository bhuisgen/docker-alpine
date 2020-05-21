FROM alpine:3.11

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-fabric" \
      org.label-schema.description="alpine-fabric image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

RUN apk add --update ca-certificates libffi openssl python2 py2-pip && \
    apk add --update --no-cache --virtual .build-deps build-base ca-certificates libffi-dev openssl-dev python2-dev && \
    pip install fabric && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/fab"]
CMD []

VOLUME ["/data"]
WORKDIR /data
