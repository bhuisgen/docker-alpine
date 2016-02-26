FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV CONSULUI_VERSION="0.6.3"

RUN apk add --update curl nginx openssl && \
    mkdir -p /var/consul/ui && \
    curl -sSL https://releases.hashicorp.com/consul/${CONSULUI_VERSION}/consul_${CONSULUI_VERSION}_web_ui.zip -o /var/consul/ui/consul_web_ui.zip && \
    cd /var/consul/ui && \
    unzip consul_web_ui.zip && \
    chown -R consul:consul /var/consul/ui && \
    rm consul_web_ui.zip && \
    apk del curl && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 80 443
