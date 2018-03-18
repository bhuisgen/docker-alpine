template {
    source = "/etc/consul-template/templates/nginx/proxy/nginx.conf.ctmpl"
    destination = "/etc/nginx/nginx.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/nginx && nginx -s reload || true'"
    perms = 0644
}
