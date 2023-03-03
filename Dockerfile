FROM alpine:3.17

RUN apk add --update --no-cache --progress build-base docker-cli
