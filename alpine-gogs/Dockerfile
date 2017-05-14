FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV GOGS_VERSION=0.11.4 \
    GIT_HOME=/home/git

RUN mkdir -p ${GIT_HOME} && \
    addgroup -S git && \
    adduser -S -D -g "" -G git -s /usr/bin/git-shell -h ${GIT_HOME} git && \
    chown -R git:git ${GIT_HOME} && \
    mkdir -p ${GIT_HOME}/git-shell-commands && \
    chmod 755 ${GIT_HOME}/git-shell-commands

RUN apk add --update git libc6-compat linux-pam openssh tar && \
    mkdir -p /usr/local/gogs /usr/local/gogs/custom/conf /var/lib/gogs && \
    curl -sSL https://dl.gogs.io/${GOGS_VERSION}/linux_amd64.tar.gz | tar -xzo -C /usr/local/gogs --strip-components 1 && \
    mkdir -p /lib64 && \
    ln /lib/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2 && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 3000 22
VOLUME ["/home/git", "/var/lib/gogs"]
