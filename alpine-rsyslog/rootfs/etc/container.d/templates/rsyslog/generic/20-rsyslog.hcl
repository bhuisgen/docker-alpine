template {
  source      = "/etc/container.d/templates/rsyslog/generic/rsyslog.conf.ctmpl"
  destination = "/etc/rsyslog.conf"
  perms       = 0644
}
