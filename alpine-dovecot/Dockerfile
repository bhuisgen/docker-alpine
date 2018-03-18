FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV VMAIL_HOME=/var/mail/vhosts

RUN mkdir -p ${VMAIL_HOME} && \
    addgroup -g 5000 -S vmail && \
    adduser -u 5000 -S -D -g "" -G vmail -s /bin/sh -h ${VMAIL_HOME} vmail && \
    chown vmail:vmail ${VMAIL_HOME}

RUN apk add --update dovecot dovecot-ldap dovecot-mysql dovecot-pigeonhole-plugin dovecot-pgsql dovecot-sqlite && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 24 110 143 993 995 12345
VOLUME ["/var/mail"]
