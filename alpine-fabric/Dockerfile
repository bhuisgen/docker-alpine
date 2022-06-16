FROM alpine:3.15

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-fabric" \
    org.label-schema.description="alpine-fabric image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

RUN apk add --update --no-cache --progress ca-certificates libffi openssl python3 py3-pip && \
    apk add --virtual .build-deps --no-cache --progress build-base ca-certificates cargo libffi-dev openssl-dev \
        python3-dev rust && \
    pip install fabric && \
    apk del .build-deps

ENTRYPOINT ["/usr/bin/fab"]
CMD []

VOLUME ["/data"]
WORKDIR /data
