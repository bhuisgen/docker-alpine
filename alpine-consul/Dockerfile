FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV CONSUL_VERSION="0.6.3" \
    CONSULUI_VERSION="0.6.3" \
    GOMAXPROCS=2

RUN apk add --update bash gcc git go make musl-dev zip && \
    export GOPATH=/src && \
    export PATH=$PATH:${GOPATH}/bin && \
    go get github.com/hashicorp/consul && \
    cd ${GOPATH}/src/github.com/hashicorp/consul && \
    git checkout -q --detach "v${CONSUL_VERSION}" && \
    make dev && \
    mv bin/consul /bin && \
    addgroup consul && \
    adduser -D -G consul consul && \
    mkdir -p /var/consul && \
    chown -R consul:consul /var/consul && \
    mkdir -p /var/consul/ui && \
    curl -sSL https://releases.hashicorp.com/consul/${CONSULUI_VERSION}/consul_${CONSULUI_VERSION}_web_ui.zip -o /var/consul/ui/consul_web_ui.zip && \
    cd /var/consul/ui && \
    unzip consul_web_ui.zip && \
    chown -R consul:consul /var/consul/ui && \
    rm consul_web_ui.zip && \
    rm -fr "${GOPATH}" && \
    apk del bash gcc git go make musl-dev zip && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8300/tcp 8301/tcp 8301/udp 8302/tcp 8302/udp 8400/tcp 8500/tcp 8600/tcp 8600/udp
