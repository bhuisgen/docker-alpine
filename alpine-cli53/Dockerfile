FROM alpine:3.12

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-cli53" \
      org.label-schema.description="alpine-cli53 image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV GOPATH=/go

RUN apk add --update --no-cache --virtual .build-deps build-base git go make && \
    go get github.com/barnybug/cli53 && \
    cd $GOPATH/src/github.com/barnybug/cli53 && \
    make install && \
    mv /go/bin/cli53 /usr/local/bin/cli53 && \
    rm -rf $GOPATH && \
    apk del .build-deps && \
    rm -rf var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/cli53"]
CMD []

VOLUME ["/data"]
WORKDIR /data
