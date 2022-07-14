ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-ipfs" \
    org.label-schema.description="alpine-ipfs image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION"

RUN mkdir /var/lib/ipfs && \
    addgroup -S ipfs && \
    adduser -S -D -g "" -G ipfs -s /sbin/nologin -h /var/lib/ipfs ipfs && \
    chown ipfs:ipfs /var/lib/ipfs

RUN apk add --update --no-cache --progress go-ipfs

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 4001 4001/udp 5001 8080 8081
VOLUME ["/var/lib/ipfs"]
