ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-nodered" \
    org.label-schema.description="alpine-nodered image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ENV NODERED_VERSION=2.2.2

RUN apk add --update --no-cache --progress nodejs npm build-base git python3 && \
    git clone -b ${NODERED_VERSION} https://github.com/node-red/node-red.git /usr/local/node-red && \
    git clone https://github.com/node-red/node-red.git && \
    cd /usr/local/node-red && \
    npm install && \
    npm run build && \
    mkdir /var/lib/node-red

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 1880
VOLUME ["/var/lib/node-red"]
