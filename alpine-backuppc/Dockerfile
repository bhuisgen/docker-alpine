ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-backuppc" \
      org.label-schema.description="alpine-backuppc image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION" \
      org.label-schema.schema-version="1.0"

RUN apk add --update backuppc fcgiwrap openssh-client perl-cgi spawn-fcgi sudo tar && \
    mkdir /var/lib/backuppc && \
    mv /etc/BackupPC /var/lib/backuppc/etc && \
    ln -sf /var/lib/backuppc/etc /etc/BackupPC && \
    mv /var/lib/BackupPC /var/lib/backuppc/data && \
    ln -sf /var/lib/backuppc/data /var/lib/BackupPC && \
    mv /var/log/BackupPC /var/lib/backuppc/log && \
    ln -sf /var/lib/backuppc/log /var/log/BackupPC && \
    mkdir /var/run/backuppc && \
    chown backuppc:backuppc /var/run/backuppc && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 9000
VOLUME ["/var/lib/backuppc", "/var/www"]
