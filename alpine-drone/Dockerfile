FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV DRONE_VERSION=0.8.5 \
    GOPATH=/usr/local

RUN mkdir /var/lib/drone && \
    addgroup -S drone && \
    adduser -S -D -g "" -G drone -s /sbin/nologin -h /var/lib/drone drone

RUN apk add --update build-base go git && \
    mkdir -p /usr/local/src/github.com/drone/drone && \
    git clone -b v${DRONE_VERSION} https://github.com/drone/drone.git /usr/local/src/github.com/drone/drone && \
    go get -u github.com/drone/drone-ui/dist && \
    go get -u golang.org/x/net/context && \
    go get -u golang.org/x/net/context/ctxhttp && \
    go get -u github.com/golang/protobuf/proto && \
    go get -u github.com/golang/protobuf/protoc-gen-go && \
    go install github.com/drone/drone/cmd/drone-agent && \
    go install github.com/drone/drone/cmd/drone-server && \
    apk del build-base go git && \
    rm -rf /var/cache/apk/* /usr/local/src/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8000 9000
VOLUME ["/var/lib/drone"]
