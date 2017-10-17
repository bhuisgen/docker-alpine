FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV VAULT_VERSION=0.8.3

RUN mkdir -p /var/lib/vault && \
    addgroup -S vault && \
    adduser -S -D -g "" -G vault -s /sbin/nologin -h /var/lib/vault vault && \
    chown -R vault:vault /var/lib/vault

RUN apk add --update zip && \
    curl -sSL https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip -o /tmp/vault.zip && \
    unzip /tmp/vault.zip -d /bin && \
    rm /tmp/vault.zip && \
    apk del zip && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8200
VOLUME ["/var/lib/vault"]
