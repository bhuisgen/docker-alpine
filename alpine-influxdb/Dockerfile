FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV INFLUXDB_VERSION=v1.1.1

RUN mkdir -p /var/lib/influxdb && \
    addgroup -S influxdb && \
    adduser -S -D -g "" -G influxdb -s /sbin/nologin -h /var/lib/influxdb influxdb

RUN apk add --update git go musl-dev && \
    export GOPATH=/go && \
    export PATH=$GOPATH/bin:$PATH && \
    go get github.com/sparrc/gdm && \
    go get github.com/influxdata/influxdb && \
    cd $GOPATH/src/github.com/influxdata/influxdb && \
    git checkout -q --detach "$INFLUXDB_VERSION" && \
    gdm restore && \
    LDFLAGS="-X main.version==$INFLUXDB_VERSION" && \
    LDFLAGS="$LDFLAGS -X main.branch==master" && \
    LDFLAGS="$LDFLAGS -X main.commit==$(git rev-parse --short HEAD)" && \
    LDFLAGS="$LDFLAGS -X main.buildTime==$(date -Iseconds)" && \
    go clean ./... && \
    go install -ldflags="$LDFLAGS" ./... && \
    cp $GOPATH/bin/influx* /usr/bin/ && \
    rm -rf $GOPATH && \
    apk del git go musl-dev && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8086
VOLUME ["/var/lib/influxdb"]
