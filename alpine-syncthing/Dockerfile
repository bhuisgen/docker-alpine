FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV SYNCTHING_VERSION=0.14.35

RUN curl -sSL https://github.com/syncthing/syncthing/releases/download/v${SYNCTHING_VERSION}/syncthing-linux-amd64-v${SYNCTHING_VERSION}.tar.gz | tar -xzo -C /usr/local/bin --strip-components 1 syncthing-linux-amd64-v${SYNCTHING_VERSION}/syncthing

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8384 22000 21027/udp
VOLUME ["/var/lib/syncthing", "/data"]
