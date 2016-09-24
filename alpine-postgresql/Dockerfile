FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

ENV PGHOME=/var/lib/postgresql \
    PGDATA=/var/lib/postgresql/data

RUN apk add --update postgresql postgresql-contrib && \
    mkdir -p ${PGHOME} ${PGDATA} && \
    chown -R postgres ${PGHOME} && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 5432
VOLUME ["/var/lib/postgresql"]
