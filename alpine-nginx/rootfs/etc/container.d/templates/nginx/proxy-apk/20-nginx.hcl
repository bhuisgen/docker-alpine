template {
  source      = "/etc/container.d/templates/nginx/proxy-apk/nginx.conf.ctmpl"
  destination = "/etc/nginx/nginx.conf"
  command     = "/bin/sh -c 'test -d /run/service/nginx && nginx -s reload || true'"
  perms       = 0644
}
