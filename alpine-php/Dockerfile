FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN mkdir -p /var/www && \
    addgroup -g 82 -S www-data && \
    adduser -u 82 -S -D -g "" -G www-data www-data

RUN apk add --update php7 \
        php7-bcmath \
        php7-cli \
        php7-ctype \
        php7-curl \
        php7-fpm \
        php7-gd \
        php7-gettext \
        php7-iconv \
        php7-json \
        php7-ldap \
        php7-mbstring \
        php7-mysqli \
        php7-mysqlnd \
        php7-opcache \
        php7-openssl \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-pgsql \
        php7-session \
        php7-simplexml \
        php7-sockets \
        php7-sqlite3 \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-zip \
        php7-zlib && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 9000
VOLUME ["/var/www"]
