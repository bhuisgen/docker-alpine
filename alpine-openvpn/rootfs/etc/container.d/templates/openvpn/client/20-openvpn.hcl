template {
  source      = "/etc/container.d/templates/openvpn/client/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-openvpn"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/openssh/client/config.ctmpl"
  destination = "/etc/openvpn/config"
  perms       = 0644
}
