FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV OPENLDAP_CONFIGDIR=/var/lib/openldap/slapd.d

RUN apk add --update openldap openldap-back-mdb openldap-overlay-all openldap-clients && \
    mkdir /var/run/openldap && \
    chown ldap:ldap /var/run/openldap && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 389
VOLUME ["/var/lib/openldap"]
