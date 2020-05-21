ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-python" \
      org.label-schema.description="alpine-python image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

RUN apk add --update python3 && \
    python3 -m ensurepip --upgrade && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
CMD []
