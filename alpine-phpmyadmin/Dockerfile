FROM alpine:3.17

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-phpmyadmin" \
    org.label-schema.description="alpine-phpmyadmin image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ADD https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-english.tar.gz /tmp/phpmyadmin.tar.gz

RUN apk add --update --no-cache --progress tar && \
    mkdir /var/www && \
    tar -xzf /tmp/phpmyadmin.tar.gz -C /var/www --strip-components 1 && \
    rm /tmp/phpmyadmin.tar.gz && \
    apk del tar

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
