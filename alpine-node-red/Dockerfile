ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV NODERED_VERSION=2.1.3

RUN apk add --update nodejs npm build-base git python3 && \
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
