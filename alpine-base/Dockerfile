FROM alpine:3.3
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV LANG="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    TERM="xterm" \
    S6OVERLAY_VERSION="v1.17.1.1"

RUN apk add --update bind-tools curl && \
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6OVERLAY_VERSION}/s6-overlay-amd64.tar.gz | tar xvfz - -C / && \
    apk del curl && \
    rm -rf /var/cache/apk/* /src

COPY root /
