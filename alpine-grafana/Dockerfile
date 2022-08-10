ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-grafana" \
    org.label-schema.description="alpine-grafana image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

RUN mkdir /var/lib/grafana && \
    addgroup -S grafana && \
    adduser -S -D -g "" -G grafana -s /sbin/nologin -h /var/lib/grafana grafana && \
    chown grafana:grafana /var/lib/grafana && \
    chmod 700 /var/lib/grafana

ADD https://dl.grafana.com/oss/release/grafana-8.5.5.linux-amd64.tar.gz /tmp/grafana.tar.gz

RUN apk add --update --no-cache --progress libc6-compat tar && \
    mkdir /usr/local/grafana && \
    tar -xzf /tmp/grafana.tar.gz -C /usr/local/grafana --strip-components 1 && \
    rm /tmp/grafana.tar.gz && \
    apk del tar

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8888
