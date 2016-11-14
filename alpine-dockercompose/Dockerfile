FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV DOCKERCOMPOSE_VERSION=1.8.1

RUN apk add --update py-pip && \
    pip install docker-compose==${DOCKERCOMPOSE_VERSION} && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["docker-compose"]
CMD ["--help"]

VOLUME ["/data"]
WORKDIR /data
