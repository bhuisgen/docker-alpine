ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-ndppd" \
    org.label-schema.description="alpine-ndppd image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ADD https://github.com/DanielAdolfsson/ndppd/archive/0.2.5.tar.gz /tmp/ndppd.tar.gz

COPY patch/logger.patch /tmp/

RUN apk add --update --no-cache --progress libc6-compat libgcc libstdc++ && \
    apk add --virtual .build-deps --no-cache --progress build-base git linux-headers make && \
    mkdir -p /usr/src/ndppd && \
    tar -xzf /tmp/ndppd.tar.gz -C /usr/src/ndppd --strip-components 1 && \
    rm /tmp/ndppd.tar.gz && \
    cd /usr/src/ndppd && \
    patch -p1 < /tmp/logger.patch && \
    make && \
    make install && \
    rm -rf /usr/src/ndppd /tmp/logger.patch && \
    apk del .build-deps

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []
