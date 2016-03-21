FROM bhuisgen/alpine-base:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    rm -rf /var/cache/apk/*

ADD root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 80
