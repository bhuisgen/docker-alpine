template {
  source      = "/etc/container.d/templates/openvpn/server/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-openvpn"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/openssh/server/config.ctmpl"
  destination = "/etc/openvpn/config"
  perms       = 0644
}
