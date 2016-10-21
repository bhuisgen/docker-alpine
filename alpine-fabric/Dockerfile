FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted \
        fabric && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["fab"]
CMD []

VOLUME ["/data"]
WORKDIR /data
