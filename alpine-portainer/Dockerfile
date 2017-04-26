FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV PORTAINER_VERSION=1.12.4 \
    PORTAINER_HOME=/var/lib/portainer

RUN mkdir -p ${PORTAINER_HOME} && \
    addgroup -S portainer && \
    adduser -S -D -g "" -G portainer -s /bin/sh -h ${PORTAINER_HOME} portainer && \
    chown -R portainer:portainer ${PORTAINER_HOME}

RUN curl -sSL https://github.com/portainer/portainer/releases/download/${PORTAINER_VERSION}/portainer-${PORTAINER_VERSION}-linux-amd64.tar.gz | tar -xzo -C /usr/local

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
VOLUME ["/var/lib/portainer"]
