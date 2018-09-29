template {
  source      = "/etc/consul-template/templates/jetty/static/10-jetty.ctmpl"
  destination = "/etc/cont-init.d/10-jetty"
  perms       = 0755
}
