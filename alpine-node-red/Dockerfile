ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV NODERED_VERSION=1.0.6

RUN apk add --update --no-cache nodejs npm build-base git python && \
    git clone -b ${NODERED_VERSION} https://github.com/node-red/node-red.git /usr/local/node-red && \
    git clone https://github.com/node-red/node-red.git && \
    cd /usr/local/node-red && \
    npm install && \
    npm run build && \
    mkdir /var/lib/node-red && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 1880
VOLUME ["/var/lib/node-red"]
