ARG TAG

FROM bhuisgen/alpine-base:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV ETCD_VERSION=3.4.3 \
    ETCD_USER=etcd \
    ETCD_HOME=/var/lib/etcd

RUN mkdir /var/lib/etcd && \
    addgroup -S etcd && \
    adduser -S -D -g "" -G etcd -s /sbin/nologin -h /var/lib/etcd etcd && \
    chown etcd:etcd /var/lib/etcd

RUN apk add --update tar && \
    mkdir /usr/local/etcd && \
    curl -sSL https://github.com/coreos/etcd/releases/download/v${ETCD_VERSION}/etcd-v${ETCD_VERSION}-linux-amd64.tar.gz | \
        tar -xzo -C /usr/local/etcd --strip-components 1 && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 2379 2380
VOLUME ["/var/lib/etcd"]
