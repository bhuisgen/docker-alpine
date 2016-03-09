FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV CONSUL_VERSION="0.6.3" \
    CONSULUI_VERSION="0.6.3" \
    GOMAXPROCS=2

RUN apk update && \
    apk upgrade && \
    apk add curl zip && \
    curl -sSL https://releases.hashicorp.com/consul/${CONSULUI_VERSION}/consul_${CONSULUI_VERSION}_linux_amd64.zip -o /bin/consul.zip && \
    cd /bin && \
    unzip consul.zip && \
    mkdir -p /var/consul && \
    addgroup consul && \
    adduser -D -G consul -s /sbin/nologin -h /var/consul consul && \
    rm /bin/consul.zip && \
    mkdir -p /var/consul/ui && \
    curl -sSL https://releases.hashicorp.com/consul/${CONSULUI_VERSION}/consul_${CONSULUI_VERSION}_web_ui.zip -o /var/consul/ui/consul_web_ui.zip && \
    cd /var/consul/ui && \
    unzip consul_web_ui.zip && \
    chown -R consul:consul /var/consul/ui && \
    rm consul_web_ui.zip && \
    apk del curl zip && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8300/tcp 8301/tcp 8301/udp 8302/tcp 8302/udp 8400/tcp 8500/tcp 8600/tcp 8600/udp
