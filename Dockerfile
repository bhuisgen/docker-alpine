FROM alpine:3.11

RUN apk add --update build-base docker && \
    rm -rf /var/cache/apk/*
