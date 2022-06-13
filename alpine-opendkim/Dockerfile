ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-opendkim" \
    org.label-schema.description="alpine-opendkim image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

RUN apk add --update --no-cache --progress opendkim && \
    mkdir /var/run/opendkim && \
    chown opendkim:opendkim /var/run/opendkim && \
    rm -f /etc/opendkim/opendkim.conf.sample

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8891
VOLUME ["/var/lib/opendkim"]
