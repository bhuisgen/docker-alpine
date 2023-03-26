ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG} AS dist

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-rspamd" \
    org.label-schema.description="alpine-rspamd image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

RUN apk add --update --no-cache --progress rspamd rspamd-proxy

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 11333
VOLUME ["/var/lib/rspamd"]
