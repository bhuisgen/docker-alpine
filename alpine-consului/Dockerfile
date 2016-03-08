FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN apk add --update nginx openssl && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    rm -rf /var/cache/apk/*

COPY root /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 443
