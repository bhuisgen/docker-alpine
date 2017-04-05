FROM bhuisgen/alpine-base-consul:latest
MAINTAINER Boris HUISGEN <bhuisgen@hbis.fr>

RUN mkdir -p /var/www && \
    addgroup -g 82 -S www-data && \
    adduser -u 82 -S -D -g "" -G www-data www-data

# RUN apk add --update --repository http://dl-3.alpinelinux.org/alpine/edge/main/ --allow-untrusted \
#         nginx nginx-mod-stream && \
#     ln -sf /dev/stdout /var/log/nginx/access.log && \
#     ln -sf /dev/stderr /var/log/nginx/error.log && \
#     rm -rf /var/cache/apk/*

RUN apk add --update nginx && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 80 443
VOLUME ["/var/www"]
