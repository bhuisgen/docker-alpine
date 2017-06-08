FROM bhuisgen/alpine-build-rpi:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN [ "cross-build-start" ]

RUN apk add --update python3 py3-pip && \
    python3 -m ensurepip --upgrade && \
    pip3 install -U pip setuptools setuptools_git setuptools_lint setuptools_pep8 setuptools_scm && \
    rm -rf /var/cache/apk/*

RUN [ "cross-build-end" ]

COPY rootfs/ /
