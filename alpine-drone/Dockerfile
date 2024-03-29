ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-drone" \
    org.label-schema.description="alpine-drone image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ENV DRONE_VERSION=2.12.0 \
    GOPATH=/usr/local

RUN mkdir /var/lib/drone && \
    addgroup -S drone && \
    adduser -S -D -g "" -G drone -s /sbin/nologin -h /var/lib/drone drone && \
    chown drone:drone /var/lib/drone && \
    chmod 700 /var/lib/drone

RUN apk add --update --no-cache --progress --virtual .build-deps build-base go git && \
    mkdir -p /usr/local/src/github.com/drone/drone && \
    git clone -b v${DRONE_VERSION} https://github.com/drone/drone.git /usr/local/src/github.com/drone/drone && \
    cd /usr/local/src/github.com/drone/drone && \
    go install -trimpath -ldflags='-w -s' -tags "oss nolimit" github.com/drone/drone/cmd/drone-server && \
    apk del .build-deps && \
    rm -rf /usr/local/src/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8000 9000
VOLUME ["/var/lib/drone"]
