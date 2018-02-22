FROM alpine:3.7
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV PASSBOLT_VERSION=1.6.5

RUN apk add --update curl tar && \
    mkdir -p /var/www && \
    curl -sSL https://github.com/passbolt/passbolt_api/archive/v${PASSBOLT_VERSION}.tar.gz | tar -xzo -C /var/www --strip-components 1 && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/sh"]
CMD []
VOLUME ["/var/www"]
