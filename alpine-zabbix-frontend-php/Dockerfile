FROM alpine:3.15

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-zabbix-frontend-php" \
      org.label-schema.description="alpine-zabbix-frontend-php image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

RUN apk add --update --no-cache --progress zabbix-webif && \
    ln -s /usr/share/webapps/zabbix/ /var/www

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
