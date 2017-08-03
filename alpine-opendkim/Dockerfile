FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update opendkim && \
    rm -f /etc/opendkim/opendkim.conf.sample && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 12345
VOLUME ["/var/lib/opendkim"]
