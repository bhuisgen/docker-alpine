FROM bhuisgen/alpine-base:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update \
        build-base libffi libffi-dev openssl openssl-dev python2 python2-dev py2-pip && \
    pip install fabric && \
    apk del build-base libffi-dev openssl-dev python2-dev && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["fab"]
CMD []

VOLUME ["/data"]
WORKDIR /data
