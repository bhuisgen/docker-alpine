ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update postfix postfix-ldap postfix-mysql postfix-pcre postfix-pgsql postfix-sqlite && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 25 587
VOLUME ["/var/spool/postfix", "/var/mail"]
