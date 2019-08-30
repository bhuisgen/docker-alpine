FROM alpine:3.9
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV WORDPRESS_VERSION=4.9.8

RUN apk add --update curl tar && \
    mkdir /var/www && \
    curl -sSL https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz | tar -xzo -C /var/www --strip-components 1 && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
