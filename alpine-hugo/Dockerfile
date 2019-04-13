FROM alpine:3.10
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV HUGO_VERSION=0.54.0

RUN apk add --update curl tar && \
    mkdir /usr/local/hugo && \
    curl -sSL https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz | \
        tar -xzo -C /usr/local/hugo && \
    apk del curl tar && \
    rm -rf /var/cache/apk/*


ENTRYPOINT ["/usr/local/hugo/hugo"]
CMD []

EXPOSE 1313

VOLUME ["/data"]
WORKDIR /data
