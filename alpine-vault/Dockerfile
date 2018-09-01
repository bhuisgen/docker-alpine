FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV VAULT_VERSION=0.10.4

RUN mkdir /var/lib/vault && \
    addgroup -S vault && \
    adduser -S -D -g "" -G vault -s /sbin/nologin -h /var/lib/vault vault && \
    chown vault:vault /var/lib/vault

RUN apk add --update libcap zip && \
    curl -sSL https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip \
        -o /tmp/vault.zip && \
    unzip /tmp/vault.zip -d /bin && \
    setcap cap_ipc_lock=+ep $(readlink -f $(which vault)) && \
    rm /tmp/vault.zip && \
    apk del libcap zip && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8200 8201
VOLUME ["/var/lib/vault"]
