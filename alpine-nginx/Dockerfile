ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
      org.label-schema.build-date="$BUILD_DATE" \
      org.label-schema.name="alpine-nginx" \
      org.label-schema.description="alpine-nginx image" \
      org.label-schema.vcs-ref="$GIT_COMMIT" \
      org.label-schema.vcs-url="$GIT_URL" \
      org.label-schema.vendor="Boris HUISGEN" \
      org.label-schema.version="$BUILD_VERSION"

RUN mkdir -p /var/www && \
    grep -q "^www-data$" /etc/group || addgroup -g 82 -S www-data && \
    grep -q "^www-data$" /etc/passwd || adduser -u 82 -S -D -g "" -G www-data www-data

RUN apk add --update nginx && \
    rm -fr /var/www/* && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 80 443
VOLUME ["/var/cache/nginx", "/var/www"]
