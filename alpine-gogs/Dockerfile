FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV GOGS_VERSION=0.11.43

RUN mkdir /var/lib/gogs /var/lib/gogs/git && \
    addgroup git && \
    adduser -D -g "" -G git -s /bin/bash -h /var/lib/gogs/git git && \
    echo git:* | chpasswd && \
    chown git:git /var/lib/gogs/git && \
    mkdir /var/lib/gogs/git/git-shell-commands && \
    chmod 755 /var/lib/gogs/git/git-shell-commands

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
