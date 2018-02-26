FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN apk add --update backuppc fcgiwrap openssh-client perl-cgi spawn-fcgi && \
    mkdir -p /var/run/backuppc && \
    chown backuppc:backuppc /var/run/backuppc && \
    ln -f /var/www/cgi-bin/BackupPC_Admin /var/www/htdocs/index.cgi && \
    chmod +x /var/www/htdocs/index.cgi && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 9000
VOLUME ["/var/lib/BackupPC", "/var/www"]
