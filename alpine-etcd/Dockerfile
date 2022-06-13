ARG BASE
ARG TAG

FROM bhuisgen/alpine-base:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-etcd" \
    org.label-schema.description="alpine-etcd image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ENV ETCD_USER=etcd \
    ETCD_HOME=/var/lib/etcd

RUN mkdir /var/lib/etcd && \
    addgroup -S etcd && \
    adduser -S -D -g "" -G etcd -s /sbin/nologin -h /var/lib/etcd etcd && \
    chown etcd:etcd /var/lib/etcd && \
    chmod 700 /var/lib/etcd

ADD https://github.com/coreos/etcd/releases/download/v3.5.4/etcd-v3.5.4-linux-amd64.tar.gz /tmp/etcd.tar.gz

RUN apk add --update --no-cache --progress tar && \
    mkdir /usr/local/etcd && \
    tar -xzf /tmp/etcd.tar.gz --no-same-owner -C /usr/local/etcd --strip-components 1 && \
    rm -fr /tmp/etcd.tar.gz /usr/local/etcd/Documentation /usr/local/etcd/README* && \
    apk del tar

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 2379 2380
VOLUME ["/var/lib/etcd"]

HEALTHCHECK CMD "[ $(/command/s6-svstat /run/service/etcd | grep -c '^up ') == '1' ]"
