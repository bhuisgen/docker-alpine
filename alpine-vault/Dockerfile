ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-vault" \
      org.label-schema.description="alpine-vault image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV VAULT_VERSION=1.3.4

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
