ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV NDPPD_VERSION=0.2.5

COPY patch/logger.patch /tmp/

RUN apk add --update --no-cache --virtual .build-deps build-base git linux-headers make && \
    mkdir -p /usr/src/ndppd && \
    curl -sSL https://github.com/DanielAdolfsson/ndppd/archive/${NDPPD_VERSION}.tar.gz | \
        tar -xzo -C /usr/src/ndppd --strip-components 1 && \
    cd /usr/src/ndppd && \
    patch -p1 < /tmp/logger.patch && \
    make && \
    make install && \
    rm -rf /usr/src/ndppd /tmp/logger.patch && \
    apk del .build-deps && \
    apk --no-cache add libc6-compat libgcc libstdc++ && \
    rm -rf var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []
