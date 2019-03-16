ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

COPY rootfs/ /

ENTRYPOINT ["/bin/sh", "/usr/local/backup/run.sh"]
CMD []

WORKDIR /usr/local/backup

