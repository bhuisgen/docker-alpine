FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV DOCKERCOMPOSE_VERSION=1.15.0

RUN apk add --update python3 && \
    python3 -m ensurepip --upgrade && \
    pip3 install docker-compose==${DOCKERCOMPOSE_VERSION} && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["docker-compose"]
CMD []

VOLUME ["/data"]
WORKDIR /data
