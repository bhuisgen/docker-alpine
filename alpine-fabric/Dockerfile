FROM alpine:3.10
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update ca-certificates libffi openssl python2 py2-pip && \
    apk add --update --no-cache --virtual .build-deps build-base ca-certificates libffi-dev openssl-dev python2-dev && \
    pip install fabric && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/fab"]
CMD []

VOLUME ["/data"]
WORKDIR /data
