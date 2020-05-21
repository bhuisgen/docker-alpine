ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

RUN apk add --update opendkim && \
    mkdir /var/run/opendkim && \
    chown opendkim:opendkim /var/run/opendkim && \
    rm -f /etc/opendkim/opendkim.conf.sample && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8891
VOLUME ["/var/lib/opendkim"]
