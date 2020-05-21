FROM alpine:3.11

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-docker-compose" \
      org.label-schema.description="alpine-docker-compose image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV DOCKERCOMPOSE_VERSION=1.25.4

RUN apk add --update python3 libffi openssl && \
    apk add --update --no-cache --virtual .build-deps build-base python3-dev libffi-dev openssl-dev && \
    python3 -m ensurepip --upgrade && \
    pip3 install docker-compose==${DOCKERCOMPOSE_VERSION} && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/docker-compose"]
CMD []

VOLUME ["/data"]
WORKDIR /data
