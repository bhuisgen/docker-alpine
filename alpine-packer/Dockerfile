FROM alpine:3.7
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV PACKER_VERSION=1.1.3

RUN apk add --update curl zip && \
    curl -sSL https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip -o /tmp/packer.zip && \
    unzip /tmp/packer.zip -d /usr/bin && \
    rm /tmp/packer.zip && \
    apk del curl zip && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["packer"]
CMD []

VOLUME ["/data"]
WORKDIR /data
