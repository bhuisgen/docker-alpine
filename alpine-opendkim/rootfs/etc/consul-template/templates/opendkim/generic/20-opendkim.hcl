template {
  source      = "/etc/consul-template/templates/opendkim/generic/opendkim.conf.ctmpl"
  destination = "/etc/opendkim/opendkim.conf"
  perms       = 0644
}
