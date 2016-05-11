FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV CONSUL_VERSION=0.6.4 \
    CONSULUI_VERSION=0.6.4 \
    GOMAXPROCS=2

RUN apk add --update curl jq zip && \
    curl -sSL https://releases.hashicorp.com/consul/${CONSULUI_VERSION}/consul_${CONSULUI_VERSION}_linux_amd64.zip -o /bin/consul.zip && \
    cd /bin && \
    unzip consul.zip && \
    rm /bin/consul.zip && \
    mkdir -p /var/lib/consului && \
    curl -sSL https://releases.hashicorp.com/consul/${CONSULUI_VERSION}/consul_${CONSULUI_VERSION}_web_ui.zip -o /var/lib/consului/consului.zip && \
    cd /var/lib/consului && \
    unzip consului.zip && \
    rm consului.zip && \
    addgroup consul && \
    adduser -S -D -g "" -G consul -s /sbin/nologin -h /var/consul consul && \
    mkdir -p /var/lib/consul && \
    apk del zip && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8600 8600/udp
VOLUME ["/var/consul"]
