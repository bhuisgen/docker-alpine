template {
  source      = "/etc/consul-template/templates/postfix/dovecot/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-postfix"
  command     = "/bin/sh -c 'test -d /var/run/s6/services/postfix && postfix reload || true'"
  perms       = 0755
}

template {
  source      = "/etc/consul-template/templates/postfix/generic/main.cf.ctmpl"
  destination = "/etc/postfix/main.cf"
  perms       = 0644
}

template {
  source      = "/etc/consul-template/templates/postfix/generic/master.cf.ctmpl"
  destination = "/etc/postfix/master.cf"
  perms       = 0644
}
