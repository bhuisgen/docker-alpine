ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

RUN mkdir /var/lib/mailhog && \
    addgroup -S mailhog && \
    adduser -S -D -g "" -G mailhog -s /sbin/nologin -h /var/lib/mailhog mailhog

RUN apk add --update --no-cache --progress --virtual .build-deps go git musl-dev && \
    export GOPATH=/usr/local/src/ && \
    go get github.com/mailhog/MailHog && \
    mv /usr/local/src/bin/MailHog /usr/local/bin && \
    apk del .build-deps && \
    rm -rf /usr/local/src/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 1025 8025
