template {
  source      = "/etc/container.d/templates/strongswan/generic/swanctl.conf.ctmpl"
  destination = "/etc/swanctl/swanctl.conf"
  perms       = 0640
}

template {
  source      = "/etc/container.d/templates/strongswan/generic/cont-init.ctmpl"
  destination = "/etc/cont-finish.d/40-strongswan.conf"
  perms       = 0755
}
