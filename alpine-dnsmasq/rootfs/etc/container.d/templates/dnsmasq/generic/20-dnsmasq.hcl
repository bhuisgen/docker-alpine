template {
  source      = "/etc/container.d/templates/dnsmasq/generic/dnsmasq.conf.ctmpl"
  destination = "/etc/dnsmasq.conf"
  perms       = 0644
}
