template {
  source      = "/etc/container.d/templates/opendkim/generic/opendkim.conf.ctmpl"
  destination = "/etc/opendkim/opendkim.conf"
  perms       = 0644
}
