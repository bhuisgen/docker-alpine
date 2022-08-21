template {
  source      = "/etc/container.d/templates/strongswan/generic/swanctl.conf.ctmpl"
  destination = "/etc/swanctl/swanctl.conf"
  perms       = 0640
}
