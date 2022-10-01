FROM alpine:3.16

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-wordpress" \
    org.label-schema.description="alpine-wordpress image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ADD https://wordpress.org/wordpress-6.0.tar.gz /tmp/wordpress.tar.gz

RUN apk add --update --no-cache --progress tar && \
    mkdir /var/www && \
    tar -xzf /tmp/wordpress.tar.gz -C /var/www --strip-components 1 && \
    rm /tmp/wordpress.tar.gz && \
    apk del tar

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
