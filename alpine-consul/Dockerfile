FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV CONSUL_VERSION=0.7.4 \
    CONSULUI_VERSION=0.7.4 \
    CONSULTEMPLATE_VERSION=0.18.1 \
    GOMAXPROCS=2

RUN mkdir -p /var/lib/consul && \
    addgroup -S consul && \
    adduser -S -D -g "" -G consul -s /sbin/nologin -h /var/lib/consul consul && \
    chown -R consul:consul /var/lib/consul

RUN apk add --update zip && \
    curl -sSL https://releases.hashicorp.com/consul/${CONSULUI_VERSION}/consul_${CONSULUI_VERSION}_linux_amd64.zip -o /tmp/consul.zip && \
    unzip /tmp/consul.zip -d /bin && \
    rm /tmp/consul.zip && \
    mkdir -p /var/lib/consului && \
    curl -sSL https://releases.hashicorp.com/consul/${CONSULUI_VERSION}/consul_${CONSULUI_VERSION}_web_ui.zip -o /tmp/consului.zip && \
    unzip /tmp/consului.zip -d /var/lib/consului && \
    rm /tmp/consului.zip && \
    curl -sSL https://releases.hashicorp.com/consul-template/${CONSULTEMPLATE_VERSION}/consul-template_${CONSULTEMPLATE_VERSION}_linux_amd64.zip -o /tmp/consul-template.zip && \
    unzip /tmp/consul-template.zip -d /bin && \
    rm /tmp/consul-template.zip && \
    apk del zip && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 8501 8600 8600/udp
VOLUME ["/var/lib/consul"]

HEALTHCHECK CMD [ $(curl -sI -w '%{http_code}' --out /dev/null http://localhost:8500/v1/agent/self) == "200" ] || exit 1
