FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update --repository http://dl-3.alpinelinux.org/alpine/edge/main/ nodejs && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
CMD []
