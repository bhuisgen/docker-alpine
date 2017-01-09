FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV CHRONOGRAF_VERSION=v1.1.1

RUN apk add --update git go && \
    export GOPATH=/go && \
    export PATH=$GOPATH/bin:$PATH && \
    go get github.com/influxdata/chronograf && \
    cd $GOPATH/src/github.com/influxdata/chronograf && \
    git checkout -q --detach "$CHRONOGRAF_VERSION" && \
    make && \
    go install github.com/influxdata/chronograf/cmd/chronograf && \
    rm -rf $GOPATH && \
    apk del git go && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []
