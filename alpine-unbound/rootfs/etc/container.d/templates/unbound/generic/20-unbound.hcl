template {
  source      = "/etc/container.d/templates/unbound/generic/unbound.conf.ctmpl"
  destination = "/etc/unbound/unbound.conf"
  perms       = 0644
}
