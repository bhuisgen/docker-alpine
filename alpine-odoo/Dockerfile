ARG BASE
ARG TAG

FROM bhuisgen/${BASE}:${TAG}

ARG BUILD_DATE
ARG BUILD_VERSION
ARG GIT_COMMIT
ARG GIT_URL

LABEL maintainer="bhuisgen@hbis.fr" \
    org.label-schema.build-date="$BUILD_DATE" \
    org.label-schema.name="alpine-odoo" \
    org.label-schema.description="alpine-odoo image" \
    org.label-schema.vcs-ref="$GIT_COMMIT" \
    org.label-schema.vcs-url="$GIT_URL" \
    org.label-schema.vendor="Boris HUISGEN" \
    org.label-schema.version="$BUILD_VERSION" \
    org.label-schema.schema-version="1.0"

ADD https://github.com/odoo/odoo/archive/15.0.tar.gz /tmp/odoo.tar.gz

RUN mkdir /var/lib/odoo && \
    addgroup -S odoo && \
    adduser -S -D -g "" -G odoo -s /sbin/nologin -h /var/lib/odoo odoo && \
    chown odoo:odoo /var/lib/odoo && \
    chmod 700 /var/lib/odoo

# wkhtmltopdf
COPY --from=madnight/alpine-wkhtmltopdf-builder:0.12.5-alpine3.10-606718795 \
    /bin/wkhtmltopdf /usr/bin/wkhtmltopdf

RUN apk add --update --no-cache --progress gettext git ghostscript gnupg nodejs npm openssl postgresql-client python3 \
        libffi libxml2 libxslt freetype jpeg lcms2 openjpeg tcl tiff tk zlib py3-pyldap py3-pip libgcc libstdc++ \
        libx11 glib libxrender libxext libintl ttf-cantarell ttf-dejavu ttf-droid ttf-freefont ttf-liberation \
        ttf-opensans && \
    echo -n "INPUT ( libldap.so )" > /usr/lib/libldap_r.so && \
    apk add --virtual .build-deps --no-cache --progress build-base python3-dev libffi-dev libxml2-dev libxslt-dev \
        freetype-dev jpeg-dev lcms2-dev openjpeg-dev tcl-dev tiff-dev tk-dev zlib-dev linux-headers postgresql-dev \
        openldap-dev rust cargo && \
    mkdir /usr/local/odoo && \
    tar -xzf /tmp/odoo.tar.gz -C /usr/local/odoo --strip-components 1 && \
    rm /tmp/odoo.tar.gz && \
    cd /usr/local/odoo && \
    pip3 install -r ./requirements.txt && \
    apk del .build-deps && \
    mkdir -p /var/log/odoo /opt/addons /opt/community && \
    chown odoo:odoo -R /var/log/odoo /opt/addons /opt/community && \
    ln -sf /dev/stdout /var/log/odoo.log

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8069/tcp 8071/tcp 8072/tcp
VOLUME ["/var/lib/odoo"]
