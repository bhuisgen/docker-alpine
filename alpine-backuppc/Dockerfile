FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

RUN mkdir -p /home/backuppc /var/run/backuppc && \
    addgroup -S backuppc && \
    adduser -S -D -g "" -G backuppc -s /bin/sh -h /home/backuppc backuppc && \
    chown -R backuppc:backuppc /home/backuppc /var/run/backuppc && \
    mkdir -p /var/www && \
    addgroup -g 82 -S www-data && \
    adduser -u 82 -S -D -g "" -G www-data www-data

RUN apk add --update backuppc fcgiwrap openssh-client perl-cgi spawn-fcgi && \
    ln -f /var/www/cgi-bin/BackupPC_Admin /var/www/index.cgi && \
    chmod +x /var/www/index.cgi && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 9000
VOLUME ["/var/lib/BackupPC", "/var/www"]
