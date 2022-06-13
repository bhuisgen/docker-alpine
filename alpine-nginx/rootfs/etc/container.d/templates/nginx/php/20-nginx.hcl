template {
  source      = "/etc/container.d/templates/nginx/php/fastcgi.conf.ctmpl"
  destination = "/etc/nginx/fastcgi.conf"
  command     = "/bin/sh -c 'test -d /run/service/nginx && nginx -s reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/nginx/php/nginx.conf.ctmpl"
  destination = "/etc/nginx/nginx.conf"
  command     = "/bin/sh -c 'test -d /run/service/nginx && nginx -s reload || true'"
  perms       = 0644
}
