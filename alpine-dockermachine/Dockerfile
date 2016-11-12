FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV DOCKERMACHINE_VERSION=0.8.2

RUN curl -sSL https://github.com/docker/machine/releases/download/v${DOCKERMACHINE_VERSION}/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
    chmod +x /usr/local/bin/docker-machine

ENTRYPOINT ["docker-machine"]
CMD ["--help"]

VOLUME ["/data"]
WORKDIR /data
