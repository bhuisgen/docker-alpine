ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG:-latest}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN mkdir /var/lib/mailhog && \
    addgroup -S mailhog && \
    adduser -S -D -g "" -G mailhog -s /sbin/nologin -h /var/lib/mailhog mailhog

RUN apk add --update --no-cache --virtual .build-deps go git musl-dev && \
    export GOPATH=/usr/local/src/ && \
    go get github.com/mailhog/MailHog && \
    mv /usr/local/src/bin/MailHog /usr/local/bin && \
    apk del .build-deps && \
    rm -rf /usr/local/src/* /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 1025 8025
