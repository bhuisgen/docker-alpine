ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-postfix" \
      org.label-schema.description="alpine-postfix image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

RUN apk add --no-cache --update postfix postfix-ldap postfix-mysql postfix-pcre postfix-pgsql postfix-sqlite

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 25 587
VOLUME ["/var/spool/postfix", "/var/mail"]
