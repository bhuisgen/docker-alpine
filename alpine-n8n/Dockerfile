ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV N8N_VERSION=0.157.0

RUN mkdir /var/lib/n8n && \
    addgroup -S n8n && \
    adduser -S -D -g "" -G n8n -s /sbin/nologin -h /var/lib/n8n n8n && \
    chown n8n:n8n /var/lib/n8n && \
    chmod 700 /var/lib/n8n

RUN apk add --update --no-cache --progress git graphicsmagick nodejs npm openssh-client tzdata && \
    apk add --virtual build-dependencies --no-cache --progress build-base ca-certificates python3 && \
    npm install -g full-icu n8n@${N8N_VERSION} && \
    apk del build-dependencies && \
    apk add --virtual fonts --no-cache --progress msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f && \
    apk del fonts && \
    find  /usr/share/fonts/truetype/msttcorefonts/ -type l -exec unlink {} \; && \
    rm -rf /root /tmp/* && \
    mkdir /root

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 5678/tcp
VOLUME ["/var/lib/n8n"]
