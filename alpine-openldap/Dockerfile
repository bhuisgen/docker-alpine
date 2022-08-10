ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-openldap" \
    org.label-schema.description="alpine-openldap image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ENV OPENLDAP_CONFIGDIR=/var/lib/openldap/slapd.d

RUN apk add --update --no-cache --progress openldap openldap-back-mdb openldap-clients openldap-overlay-all && \
    mkdir /var/run/openldap && \
    chown ldap:ldap /var/run/openldap

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 389
VOLUME ["/var/lib/openldap"]
