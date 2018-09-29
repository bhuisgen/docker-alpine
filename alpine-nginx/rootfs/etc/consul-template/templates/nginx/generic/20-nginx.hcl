template {
  source      = "/etc/consul-template/templates/nginx/generic/nginx.conf.ctmpl"
  destination = "/etc/nginx/nginx.conf"
  perms       = 0644
}
