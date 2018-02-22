FROM alpine:3.7
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV DOCKERCOMPOSE_VERSION=1.18.0

RUN apk add --update python3 && \
    python3 -m ensurepip --upgrade && \
    pip3 install docker-compose==${DOCKERCOMPOSE_VERSION} && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["docker-compose"]
CMD []

VOLUME ["/data"]
WORKDIR /data
