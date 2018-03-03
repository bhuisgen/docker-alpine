FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

COPY rootfs/ /

ENTRYPOINT ["/bin/sh", "/usr/local/backup/run.sh"]
CMD []

WORKDIR /usr/local/backup

