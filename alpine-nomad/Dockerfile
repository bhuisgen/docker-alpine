FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV NOMAD_VERSION=0.6.3

RUN mkdir -p /var/lib/nomad && \
    addgroup -S nomad && \
    adduser -S -D -g "" -G nomad -s /sbin/nologin -h /var/lib/nomad nomad && \
    chown -R nomad:nomad /var/lib/nomad

RUN apk add --update ca-certificates zip && \
    curl -sSL https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub && \
    curl -sSL https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk -o /tmp/glibc-2.25-r0.apk && \
    apk add /tmp/glibc-2.25-r0.apk && \
    rm /tmp/glibc-2.25-r0.apk && \
    curl -sSL https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip -o /tmp/nomad.zip && \
    unzip /tmp/nomad.zip -d /bin && \
    rm /tmp/nomad.zip && \
    apk del zip && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 4646 4647 4648 4648/udp
VOLUME ["/var/lib/nomad"]
