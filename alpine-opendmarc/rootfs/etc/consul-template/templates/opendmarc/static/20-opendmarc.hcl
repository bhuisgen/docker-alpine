template {
  source      = "/etc/consul-template/templates/opendmarc/generic/opendmarc.conf.ctmpl"
  destination = "/etc/opendmarc/opendmarc.conf"
  perms       = 0644
}
