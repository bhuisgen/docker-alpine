template {
  source      = "/etc/container.d/templates/hostapd/generic/hostapd.conf.ctmpl"
  destination = "/etc/hostapd/hostapd.conf"
  perms       = 0640
}
