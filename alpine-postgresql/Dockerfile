FROM bhuisgen/alpine-base-consul:latest
LABEL maintainer="Boris HUISGEN <bhuisgen@hbis.fr>"

ENV PGHOME=/var/lib/postgresql \
    PGDATA=/var/lib/postgresql/data

RUN apk add --update postgresql postgresql-contrib && \
    mkdir -p ${PGHOME} ${PGDATA} /run/postgresql && \
    chown -R postgres:postgres ${PGHOME} /run/postgresql && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 5432
VOLUME ["/var/lib/postgresql"]
