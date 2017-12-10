FROM alpine:3.7
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update build-base ca-certificates libffi libffi-dev openssl openssl-dev python2 python2-dev py2-pip && \
    pip install fabric && \
    apk del build-base ca-certificates libffi-dev openssl-dev python2-dev && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["fab"]
CMD []

VOLUME ["/data"]
WORKDIR /data
