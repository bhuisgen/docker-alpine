ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV N8N_VERSION=0.157.0

RUN mkdir /var/lib/n8n && \
    addgroup -S n8n && \
    adduser -S -D -g "" -G n8n -s /sbin/nologin -h /var/lib/n8n n8n

RUN apk add --update git graphicsmagick nodejs npm openssh-client tzdata && \
    apk add --virtual build-dependencies build-base ca-certificates python3 && \
	npm install -g full-icu n8n@${N8N_VERSION} && \
	apk del build-dependencies && \
    apk add --virtual fonts msttcorefonts-installer fontconfig && \
	update-ms-fonts && \
	fc-cache -f && \
	apk del fonts && \
	find  /usr/share/fonts/truetype/msttcorefonts/ -type l -exec unlink {} \; && \
    rm -rf /root /tmp/* /var/cache/apk/* && mkdir /root

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 5678/tcp
VOLUME ["/var/lib/n8n"]
