FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV CONSULTEMPLATE_VERSION=0.18.1

RUN mkdir -p /var/lib/consul && \
    addgroup consul && \
    adduser -S -D -g "" -G consul -s /sbin/nologin -h /var/lib/consul consul && \
    chown -R consul:consul /var/lib/consul

RUN apk add --update zip && \
    curl -sSL https://releases.hashicorp.com/consul-template/${CONSULTEMPLATE_VERSION}/consul-template_${CONSULTEMPLATE_VERSION}_linux_amd64.zip -o /tmp/consul-template.zip && \
    unzip /tmp/consul-template.zip -d /bin && \
    rm /tmp/consul-template.zip && \
    apk del zip && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

HEALTHCHECK CMD /etc/cont-consul/check || exit 1
