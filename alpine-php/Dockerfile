ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-php" \
    org.label-schema.description="alpine-php image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

RUN mkdir -p /var/www && \
    grep -q "^www-data$" /etc/group || addgroup -g 82 -S www-data && \
    grep -q "^www-data$" /etc/passwd || adduser -u 82 -S -D -g "" -G www-data www-data

RUN apk add --update --no-cache --progress php81 php81-bcmath php81-cli php81-ctype php81-curl php81-fpm php81-gd \
        php81-gettext php81-iconv php81-json php81-ldap php81-mbstring php81-mysqli php81-mysqlnd php81-opcache \
        php81-openssl php81-pdo php81-pdo_mysql php81-pdo_pgsql php81-pdo_sqlite php81-pgsql php81-session \
        php81-simplexml php81-sockets php81-sqlite3 php81-xml php81-xmlreader php81-xmlwriter php81-zip php81-zlib

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 9000
VOLUME ["/var/www"]
