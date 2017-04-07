FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV GITLFS_VERSION=2.0.2

RUN apk add --update docker git openssh-client && \
    curl -sSL https://github.com/github/git-lfs/releases/download/v${GITLFS_VERSION}/git-lfs-linux-amd64-${GITLFS_VERSION}.tar.gz | tar -xzo -C /usr/local/bin --strip-components 1 git-lfs-${GITLFS_VERSION}/git-lfs && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/usr/local/build/run.sh"]
CMD []

WORKDIR /usr/local/build
