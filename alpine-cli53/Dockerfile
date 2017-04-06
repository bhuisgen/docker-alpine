FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV GOPATH=/go

RUN apk add --update build-base git go make && \
    go get github.com/barnybug/cli53 && \
    cd $GOPATH/src/github.com/barnybug/cli53 && \
    make install && \
    mv /go/bin/cli53 /usr/local/bin/cli53 && \
    rm -rf $GOPATH && \
    apk del build-base git go make && \
    rm -rf var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/cli53"]
CMD []

VOLUME ["/data"]
WORKDIR /data
