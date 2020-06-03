FROM alpine:3.12

RUN apk add --update build-base docker && \
    rm -rf /var/cache/apk/*
