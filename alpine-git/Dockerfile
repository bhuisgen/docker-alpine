FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV GIT_HOME=/home/git \
    GITLFS_VERSION=2.0.2

RUN mkdir -p ${GIT_HOME} && \
    addgroup -S git && \
    adduser -S -D -g "" -G git -s /usr/bin/git-shell -h ${GIT_HOME} git && \
    chown -R git:git ${GIT_HOME} && \
    mkdir -p ${GIT_HOME}/git-shell-commands && \
    chmod 755 ${GIT_HOME}/git-shell-commands

RUN apk add --update git openssh && \
    curl -sSL https://github.com/github/git-lfs/releases/download/v${GITLFS_VERSION}/git-lfs-linux-amd64-${GITLFS_VERSION}.tar.gz | tar -xzo -C /usr/local/bin --strip-components 1 git-lfs-${GITLFS_VERSION}/git-lfs && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 22
VOLUME ["/home"]
