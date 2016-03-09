FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update mariadb mariadb-common mariadb-client && \
    rm -rf /var/cache/apk/*

ADD root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 3306
