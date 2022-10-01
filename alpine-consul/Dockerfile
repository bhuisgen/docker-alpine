ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-consul" \
    org.label-schema.description="alpine-consul image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ADD https://releases.hashicorp.com/consul/1.13.2/consul_1.13.2_linux_amd64.zip /tmp/consul.zip

RUN apk add --update --no-cache --progress zip && \
    unzip /tmp/consul.zip -d /bin && \
    rm /tmp/consul.zip && \
    apk del zip

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8500 8501 8600 8600/udp
VOLUME ["/var/lib/consul"]
