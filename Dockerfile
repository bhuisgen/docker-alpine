FROM alpine:3.16

RUN apk add --update --no-cache --progress build-base docker-cli
