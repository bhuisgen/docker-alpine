ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-nomad" \
    org.label-schema.description="alpine-nomad image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

RUN mkdir /var/lib/nomad && \
    addgroup -S nomad && \
    adduser -S -D -g "" -G nomad -s /sbin/nologin -h /var/lib/nomad nomad && \
    chown nomad:nomad /var/lib/nomad && \
    chmod 700 /var/lib/nomad

ADD https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub /etc/apk/keys/sgerrand.rsa.pub
ADD https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r0/glibc-2.35-r0.apk /tmp/glibc.apk
ADD https://releases.hashicorp.com/nomad/1.3.1/nomad_1.3.1_linux_amd64.zip /tmp/nomad.zip

RUN apk add --update --no-cache --progress zip && \
    apk add /tmp/glibc.apk && \
    rm /tmp/glibc.apk && \
    unzip /tmp/nomad.zip -d /bin && \
    rm /tmp/nomad.zip && \
    apk del zip

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 4646 4647 4648 4648/udp
VOLUME ["/var/lib/nomad"]
