FROM alpine:3.15

RUN apk add --update --no-cache --progress autoconf automake build-base docker-cli git openssh-client zsh apk-tools-zsh-completion docker-zsh-completion git-zsh-completion &&
    sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases|g/download/v1.1.2/zsh-in-docker.sh)" && \
    sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- -t robbyrussell