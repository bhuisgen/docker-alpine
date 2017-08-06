FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV OPENLDAP_CONFIGDIR=/var/lib/openldap/slapd.d

RUN apk add --update openldap openldap-clients && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 389
VOLUME ["/var/lib/openldap"]
