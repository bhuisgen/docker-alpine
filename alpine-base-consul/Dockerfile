FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV CONSUL_VERSION="0.6.3" \
    CONSULTEMPLATE_VERSION="0.12.2" \
    GOMAXPROCS=2

RUN apk add --update bash gcc git go make musl-dev zip && \
    export GOPATH=/src && \
    export PATH=${PATH}:${GOPATH}/bin && \
    go get github.com/hashicorp/consul && \
    cd $GOPATH/src/github.com/hashicorp/consul && \
    git checkout -q --detach "v${CONSUL_VERSION}" && \
    make dev && \
    mv bin/consul /bin && \
    addgroup consul && \
    adduser -D -G consul consul && \
    mkdir -p /var/consul && \
    chown -R consul:consul /var/consul && \
    go get github.com/hashicorp/consul-template && \
    cd $GOPATH/src/github.com/hashicorp/consul-template && \
    git checkout -q --detach "v${CONSULTEMPLATE_VERSION}" && \
    make dev && \
    mv bin/consul-template /bin && \
    mkdir -p /etc/consul-template/templates/ && \
    rm -fr "${GOPATH}" && \
    apk del bash gcc git go make musl-dev zip && \
    rm -rf /var/cache/apk/*

COPY root /
