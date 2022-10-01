FROM alpine:3.16

RUN apk add --update --no-cache --progress build-base docker-cli git openssh-client zsh \
        autoconf automake && \
    sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases|g/download/v1.1.2/zsh-in-docker.sh)" && \
    sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- -t robbyrussell