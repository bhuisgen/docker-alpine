FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV ROUNDCUBEMAIL_VERSION=1.3.0

RUN apk add --update tar && \
    mkdir -p /var/www && \
    curl -sSL https://github.com/roundcube/roundcubemail/releases/download/${ROUNDCUBEMAIL_VERSION}/roundcubemail-${ROUNDCUBEMAIL_VERSION}-complete.tar.gz | tar -xzo -C /var/www --strip-components 1 && \
    apk del tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
