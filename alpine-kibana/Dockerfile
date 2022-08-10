ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-kibana" \
    org.label-schema.description="alpine-kibana image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

RUN mkdir /var/lib/kibana && \
    addgroup -S kibana && \
    adduser -S -D -g "" -G kibana -s /sbin/nologin -h /var/lib/kibana kibana && \
    chown kibana:kibana /var/lib/kibana

ADD https://artifacts.elastic.co/downloads/kibana/kibana-8.2.2-linux-x86_64.tar.gz /tmp/kibana.tar.gz

RUN apk add --update --no-cache --progress nodejs tar && \
    mkdir /usr/local/kibana && \
    tar -xzf /tmp/kibana.tar.gz -C /usr/local/kibana --strip-components 1 && \
    rm /tmp/kibana.tar.gz && \
    ln -sf /usr/bin/node /usr/local/kibana/node/bin/node && \
    rm -fr /usr/local/kibana/bin/*.bat && \
    chown -R kibana:kibana /usr/local/kibana && \
    apk del tar

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 5601
