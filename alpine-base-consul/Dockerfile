FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV CONSULTEMPLATE_VERSION="0.14.0"

RUN apk add --update curl jq zip && \
    curl -sSL https://releases.hashicorp.com/consul-template/${CONSULTEMPLATE_VERSION}/consul-template_${CONSULTEMPLATE_VERSION}_linux_amd64.zip -o /bin/consul-template.zip && \
    cd /bin && \
    unzip consul-template.zip && \
    rm /bin/consul-template.zip && \
    apk del zip && \
    rm -rf /var/cache/apk/*

COPY root /
