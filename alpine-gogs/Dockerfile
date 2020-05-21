ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-gogs" \
      org.label-schema.description="alpine-gogs image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV GOGS_VERSION=0.11.91 \
    GOPATH=/usr/local

RUN mkdir /var/lib/gogs /var/lib/gogs/git && \
    addgroup git && \
    adduser -D -g "" -G git -s /bin/bash -h /var/lib/gogs/git git && \
    echo git:* | chpasswd 2>/dev/null && \
    chown git:git /var/lib/gogs/git

RUN apk add --update git libc6-compat linux-pam openssh tar && \
    mkdir /usr/local/gogs && \
    curl -sSL https://dl.gogs.io/${GOGS_VERSION}/gogs_${GOGS_VERSION}_linux_amd64.tar.gz | tar -xzo -C /usr/local/gogs --strip-components 1 && \
    mkdir -p /var/lib/gogs/app/custom /var/lib/gogs/app/data /var/lib/gogs/app/log && \
    chown -R git:git /var/lib/gogs/app && \
    ln -sf /var/lib/gogs/app/custom /usr/local/gogs/custom && \
    ln -sf /var/lib/gogs/app/data /usr/local/gogs/data && \
    ln -sf /var/lib/gogs/app/log /usr/local/gogs/log && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 3000 22
VOLUME ["/var/lib/gogs"]
