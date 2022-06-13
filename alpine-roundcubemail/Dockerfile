FROM alpine:3.15

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-roundcubemail" \
    org.label-schema.description="alpine-roundcubemail image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ADD https://github.com/roundcube/roundcubemail/releases/download/1.5.1/roundcubemail-1.5.1-complete.tar.gz /tmp/roundcubemail.tar.gz

RUN apk add --update --no-cache --progress tar && \
    mkdir /var/www && \
    tar -xzf /tmp/roundcubemail.tar.gz -C /var/www --strip-components 1 && \
    rm /tmp/roundcubemail.tar.gz && \
    apk del tar

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
