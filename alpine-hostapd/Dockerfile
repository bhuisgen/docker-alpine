FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update hostapd && \
    rm -rf /var/cache/apk/*

ADD root /

ENTRYPOINT ["/init"]
CMD []
