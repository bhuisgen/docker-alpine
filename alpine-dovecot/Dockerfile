ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-dovecot" \
    org.label-schema.description="alpine-dovecot image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ENV VMAIL_HOME=/var/mail/vhosts

RUN mkdir -p ${VMAIL_HOME} && \
    addgroup -g 5000 -S vmail && \
    adduser -u 5000 -S -D -g "" -G vmail -s /bin/sh -h ${VMAIL_HOME} vmail && \
    chown vmail:vmail ${VMAIL_HOME}

RUN apk add --update --no-cache --progress dovecot dovecot-ldap dovecot-lmtpd dovecot-mysql dovecot-pigeonhole-plugin \
        dovecot-pop3d dovecot-pgsql dovecot-sqlite

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 24 110 143 993 995 12345
VOLUME ["/var/mail"]
