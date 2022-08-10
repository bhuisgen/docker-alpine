ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-git" \
    org.label-schema.description="alpine-git image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

RUN mkdir /home/git && \
    addgroup git && \
    adduser -D -g "" -G git -s /usr/bin/git-shell -h /home/git git && \
    echo git:* | chpasswd && \
    chown git:git /home/git && \
    mkdir /home/git/git-shell-commands && \
    chmod 755 /home/git/git-shell-commands

RUN apk add --update --no-cache --progress git openssh

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 22
VOLUME ["/home/git"]
