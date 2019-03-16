template {
  source      = "/etc/container.d/templates/jetty/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-jetty"
  perms       = 0755
}
