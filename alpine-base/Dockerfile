FROM alpine:3.3
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    TERM="xterm" \
    CONSULTEMPLATE_VERSION="0.14.0" \
    S6OVERLAY_VERSION="v1.17.2.0"

RUN apk update && \
    apk upgrade && \
    apk add bind-tools curl tar zip && \
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar xvfz - -C / && \
    curl -sSL https://releases.hashicorp.com/consul-template/${CONSULTEMPLATE_VERSION}/consul-template_${CONSULTEMPLATE_VERSION}_linux_amd64.zip -o /bin/consultemplate.zip && \
    cd /bin && \
    unzip consultemplate.zip && \
    rm /bin/consultemplate.zip && \
    apk del curl tar zip && \
    rm -rf /var/cache/apk/* /src

COPY root /
