FROM alpine:3.15

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-hugo" \
    org.label-schema.description="alpine-hugo image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ADD https://github.com/gohugoio/hugo/releases/download/v0.100.2/hugo_extended_0.100.2_Linux-64bit.tar.gz /tmp/hugo.tar.gz

RUN apk add --update --no-cache --progress libc6-compat libstdc++ tar && \
    mkdir /usr/local/hugo && \
    tar -xzf /tmp/hugo.tar.gz -C /usr/local/bin && \
    rm /tmp/hugo.tar.gz && \
    apk del tar

ENTRYPOINT ["/usr/local/bin/hugo"]
CMD []

EXPOSE 1313
