ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-chronograf" \
      org.label-schema.description="alpine-chronograf image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

ENV CHRONOGRAF_VERSION=1.7.14

RUN mkdir /var/lib/chronograf && \
    addgroup -S chronograf && \
    adduser -S -D -g "" -G chronograf -s /sbin/nologin -h /var/lib/chronograf chronograf

RUN apk add --update libc6-compat tar && \
    mkdir /usr/local/chronograf && \
    curl -sSL https://dl.influxdata.com/chronograf/releases/chronograf-${CHRONOGRAF_VERSION}_linux_amd64.tar.gz | \
        tar -xzo -C /usr/local/chronograf --strip-components 2 && \
    apk del tar && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8888
VOLUME ["/var/lib/chronograf"]
