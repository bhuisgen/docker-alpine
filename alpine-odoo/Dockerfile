ARG TAG

FROM bhuisgen/alpine-base-consul:${TAG}
LABEL maintainer="bhuisgen@hbis.fr"

ENV ODOO_VERSION=15.0

RUN mkdir /var/lib/odoo && \
    addgroup -S odoo && \
    adduser -S -D -g "" -G odoo -s /sbin/nologin -h /var/lib/odoo odoo

# wkhtmltopdf
COPY --from=madnight/alpine-wkhtmltopdf-builder:0.12.5-alpine3.10-606718795 \
    /bin/wkhtmltopdf /usr/bin/wkhtmltopdf

RUN apk add --update gettext git ghostscript gnupg nodejs npm openssl postgresql-client python3 \
        libffi libxml2 libxslt freetype jpeg lcms2 openjpeg tcl tiff tk zlib \
        py3-pyldap py3-pip \
        libgcc libstdc++ libx11 glib libxrender libxext libintl ttf-cantarell ttf-dejavu ttf-droid \
        ttf-freefont ttf-liberation ttf-opensans && \
    echo -n "INPUT ( libldap.so )" > /usr/lib/libldap_r.so && \
    apk add --no-cache --virtual .build-deps \
        build-base python3-dev libffi-dev libxml2-dev libxslt-dev freetype-dev jpeg-dev lcms2-dev openjpeg-dev tcl-dev \
        tiff-dev tk-dev zlib-dev linux-headers postgresql-dev openldap-dev rust cargo && \
    mkdir /usr/local/odoo && \
    curl -sSL https://github.com/odoo/odoo/archive/${ODOO_VERSION}.tar.gz | \
        tar -xzo -C /usr/local/odoo --strip-components 1 && \
	cd /usr/local/odoo && \
	pip3 install -r ./requirements.txt && \
    apk del .build-deps && \
    mkdir -p /var/log/odoo /opt/addons /opt/community && \
    chown odoo:odoo -R /var/log/odoo /opt/addons /opt/community && \
    ln -sf /dev/stdout /var/log/odoo.log && \
    rm -rf /var/cache/apk/*

COPY rootfs/ /

ENTRYPOINT ["/init"]
CMD []

EXPOSE 8069/tcp 8071/tcp 8072/tcp
VOLUME ["/var/lib/odoo"]
