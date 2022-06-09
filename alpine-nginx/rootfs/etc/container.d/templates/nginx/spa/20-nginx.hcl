template {
  source      = "/etc/container.d/templates/nginx/spa/nginx.conf.ctmpl"
  destination = "/etc/nginx/nginx.conf"
  perms       = 0644
}
