template {
    source = "/etc/consul-template/templates/nginx/php/fastcgi.conf.ctmpl"
    destination = "/etc/nginx/fastcgi.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/nginx && nginx -s reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/nginx/php/nginx.conf.ctmpl"
    destination = "/etc/nginx/nginx.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/nginx && nginx -s reload || true'"
    perms = 0644
}
