FROM alpine:3.10
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV PHPMYADMIN_VERSION=4.8.3

RUN apk add --update curl tar && \
    mkdir /var/www && \
    curl -sSL https://files.phpmyadmin.net/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-english.tar.gz | \
        tar -xzo -C /var/www --strip-components 1 && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
