FROM alpine:3.7
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update build-base docker && \
    rm -rf /var/cache/apk/*
