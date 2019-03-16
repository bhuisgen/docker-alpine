template {
  source      = "/etc/container.d/templates/nginx/generic/nginx.conf.ctmpl"
  destination = "/etc/nginx/nginx.conf"
  perms       = 0644
}
