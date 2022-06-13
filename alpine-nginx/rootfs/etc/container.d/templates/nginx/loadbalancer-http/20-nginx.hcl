template {
  source      = "/etc/container.d/templates/nginx/loadbalancer-http/nginx.conf.ctmpl"
  destination = "/etc/nginx/nginx.conf"
  command     = "/bin/sh -c 'test -d /run/service/nginx && nginx -s reload || true'"
  perms       = 0644
}
