FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV PHPMYADMIN_VERSION=4.6.5.2

RUN apk add --update tar && \
    mkdir -p /var/www && \
    curl -sSL https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.gz | tar -xzo -C /var/www --strip-components 1 && \
    apk del tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
