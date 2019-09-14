ARG TAG

FROM bhuisgen/alpine-build-make:${TAG:-latest}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update ansible && \
    rm -rf /var/cache/apk/*
