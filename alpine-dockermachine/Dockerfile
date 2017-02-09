FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV DOCKERMACHINE_VERSION=0.9.0

RUN curl -sSL https://github.com/docker/machine/releases/download/v${DOCKERMACHINE_VERSION}/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
    chmod +x /usr/local/bin/docker-machine

ENTRYPOINT ["docker-machine"]
CMD []

VOLUME ["/data"]
WORKDIR /data
