FROM alpine:3.10
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV ROUNDCUBEMAIL_VERSION=1.3.7

RUN apk add --update curl tar && \
    mkdir /var/www && \
    curl -sSL https://github.com/roundcube/roundcubemail/releases/download/${ROUNDCUBEMAIL_VERSION}/roundcubemail-${ROUNDCUBEMAIL_VERSION}-complete.tar.gz | \
        tar -xzo -C /var/www --strip-components 1 && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
