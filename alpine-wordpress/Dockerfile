FROM alpine:3.6
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV WORDPRESS_VERSION=4.8.3

RUN apk add --update curl tar && \
    mkdir -p /var/www && \
    curl -sSL https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz | tar -xzo -C /var/www --strip-components 1 && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
