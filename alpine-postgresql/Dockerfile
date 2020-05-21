ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-postgres" \
      org.label-schema.description="alpine-postgresql image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION"

ENV PGHOME=/var/lib/postgresql \
    PGDATA=/var/lib/postgresql/data

RUN apk add --update postgresql postgresql-contrib && \
    mkdir -p ${PGHOME} ${PGDATA} /run/postgresql && \
    chown postgres:postgres ${PGHOME} ${PGDATA} /run/postgresql && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 5432
VOLUME ["/var/lib/postgresql"]
