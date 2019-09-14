ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG:-latest}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV CONSUL_VERSION=1.6.1

RUN apk add --update zip && \
    curl -sSL https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip \
        -o /tmp/consul.zip && \
    unzip /tmp/consul.zip -d /bin && \
    rm /tmp/consul.zip && \
    apk del zip && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8500 8501 8600 8600/udp
VOLUME ["/var/lib/consul"]

HEALTHCHECK CMD /usr/sbin/container-check || exit 1
