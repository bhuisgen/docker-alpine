ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

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
