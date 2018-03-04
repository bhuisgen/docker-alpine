FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV GOGS_VERSION=0.11.29

RUN mkdir -p /var/lib/gogs/git /var/lib/gogs/app/custom /var/lib/gogs/app/data /var/lib/gogs/app/log && \
    addgroup git && \
    adduser -D -g "" -G git -s /usr/bin/git-shell -h /var/lib/gogs/git git && \
    chown -R git:git /var/lib/gogs/git /var/lib/gogs/app && \
    mkdir /var/lib/gogs/git/git-shell-commands && \
    chmod 755 /var/lib/gogs/git/git-shell-commands

RUN apk add --update git libc6-compat linux-pam openssh tar && \
    mkdir /usr/local/gogs && \
    curl -sSL https://dl.gogs.io/${GOGS_VERSION}/linux_amd64.tar.gz | tar -xzo -C /usr/local/gogs --strip-components 1 && \
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
