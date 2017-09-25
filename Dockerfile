FROM alpine:3.6
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update build-base docker && \
    rm -rf /var/cache/apk/*
