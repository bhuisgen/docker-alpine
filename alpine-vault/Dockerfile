ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

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

RUN mkdir /var/lib/vault && \
    addgroup -S vault && \
    adduser -S -D -g "" -G vault -s /sbin/nologin -h /var/lib/vault vault && \
    chown vault:vault /var/lib/vault && \
    chmod 700 /var/lib/vault

ADD https://releases.hashicorp.com/vault/1.12.3/vault_1.12.3_linux_amd64.zip /tmp/vault.zip

RUN apk add --update --no-cache --progress libcap zip && \
    unzip /tmp/vault.zip -d /bin && \
    rm /tmp/vault.zip && \
    setcap cap_ipc_lock=+ep $(readlink -f $(which vault)) && \
    apk del libcap zip

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8200 8201
VOLUME ["/var/lib/vault"]
