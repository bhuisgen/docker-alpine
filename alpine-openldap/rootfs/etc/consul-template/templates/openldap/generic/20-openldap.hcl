template {
  source      = "/etc/consul-template/templates/openldap/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-openldap"
  perms       = 0755
}

template {
  source      = "/etc/consul-template/templates/openldap/generic/slapd.conf.ctmpl"
  destination = "/etc/openldap/slapd.conf"
  command     = "/bin/chown root:ldap /etc/openldap/slapd.conf"
  perms       = 0640
}
