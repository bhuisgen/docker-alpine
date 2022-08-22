ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

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

RUN mkdir -p /var/lib/backuppc && \
    addgroup -S backuppc && \
    adduser -S -D -g "" -G backuppc -s /sbin/nologin -h /var/lib/backuppc backuppc && \
    chown backuppc:backuppc /var/lib/backuppc

ADD https://github.com/backuppc/backuppc/releases/download/4.4.0/BackupPC-4.4.0.tar.gz /tmp/backuppc.tar.gz
ADD https://github.com/backuppc/backuppc-xs/releases/download/0.62/BackupPC-XS-0.62.tar.gz /tmp/backuppc-xs.tar.gz
ADD https://github.com/backuppc/rsync-bpc/releases/download/3.1.3.0/rsync-bpc-3.1.3.0.tar.gz /tmp/rsync-bpc.tar.gz

RUN apk add --update --no-cache --progress openssh-client perl perl-archive-zip perl-xml-rss perl-cgi \
        perl-file-listing perl-json-xs rrdtool ttf-dejavu rsync samba-client sudo tar gzip pigz \
        lighttpd lighttpd-mod_auth msmtp && \
    apk add --update --no-cache --progress -X http://dl-cdn.alpinelinux.org/alpine/edge/community par2cmdline && \
    apk add --update --no-cache --virtual build-dependencies gcc g++ autoconf automake make git perl-dev acl-dev && \
    mkdir /tmp/backuppc-xs && \
    tar xzf /tmp/backuppc-xs.tar.gz -C /tmp/backuppc-xs --strip-components 1 && \
    cd /tmp/backuppc-xs && perl Makefile.PL && make && make install && \
    rm -fr /tmp/backuppc-xs* && \
    mkdir /tmp/rsync-bpc && \
    tar xzf /tmp/rsync-bpc.tar.gz -C /tmp/rsync-bpc --strip-components 1 && \
    cd /tmp/rsync-bpc && ./configure && make reconfigure && make && make install && \
    rm -fr /tmp/rsync-bpc* && \
    mkdir /tmp/backuppc && \
    tar xzf /tmp/backuppc.tar.gz -C /tmp/backuppc --strip-components 1 && \
    cd /tmp/backuppc && \
    mkdir /var/lib/backuppc/etc /var/lib/backuppc/data /var/lib/backuppc/log /var/lib/backuppc/tmp \
        /var/run/BackupPC && \
    chown backuppc:backuppc /var/lib/backuppc/etc /var/lib/backuppc/data /var/lib/backuppc/log \
        /var/lib/backuppc/tmp /var/run/BackupPC && \
    perl configure.pl --batch --install-dir /usr/local/backuppc --config-dir /var/lib/backuppc/etc \
        --cgi-dir /var/www/cgi-bin/BackupPC --data-dir /var/lib/backuppc/data --run-dir /var/run/BackupPC \
        --log-dir /var/lib/backuppc/log --html-dir /var/www/html/BackupPC --html-dir-url /BackupPC \
        --hostname "$HOSTNAME" --backuppc-user backuppc && \    
    rm -fr /tmp/backuppc* && \
    apk del build-dependencies && \
    ln -sf /usr/bin/msmtp /usr/sbin/sendmail

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8080
VOLUME ["/var/lib/backuppc"]
