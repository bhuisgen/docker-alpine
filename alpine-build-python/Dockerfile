FROM bhuisgen/alpine-build:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update python3 python3-dev py3-pip && \
    python3 -m ensurepip --upgrade && \
    pip3 install -U pip setuptools setuptools_git setuptools_lint setuptools_pep8 wheel && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /
