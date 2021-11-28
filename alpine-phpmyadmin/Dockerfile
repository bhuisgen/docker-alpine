FROM alpine:3.12

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

ENV PHPMYADMIN_VERSION=5.1.1

RUN apk add --update curl tar && \
    mkdir /var/www && \
    curl -sSL https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.gz | \
        tar -xzo -C /var/www --strip-components 1 && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
