FROM alpine:3.15

RUN apk add --update build-base docker && \
    rm -rf /var/cache/apk/*
