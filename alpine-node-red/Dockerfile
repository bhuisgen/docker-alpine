FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV NODERED_VERSION=0.18.7

RUN apk add --update --no-cache nodejs build-base git python && \
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