template {
  source      = "/etc/container.d/templates/strongswan/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-strongswan.conf"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/strongswan/generic/cont-finish.ctmpl"
  destination = "/etc/cont-finish.d/40-strongswan.conf"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/strongswan/generic/cont-init-monitor.ctmpl"
  destination = "/etc/cont-init.d/41-strongswan-monitor.conf"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/strongswan/generic/ipsec.conf.ctmpl"
  destination = "/etc/ipsec.conf"
  perms       = 0640
}

template {
  source      = "/etc/container.d/templates/strongswan/generic/ipsec.secrets.ctmpl"
  destination = "/etc/ipsec.secrets"
  perms       = 0640
}
