template {
  source      = "/etc/container.d/templates/postfix/dovecot/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-postfix"
  command     = "/bin/sh -c 'test -d /run/service/postfix && postfix reload || true'"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/postfix/generic/main.cf.ctmpl"
  destination = "/etc/postfix/main.cf"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/postfix/generic/master.cf.ctmpl"
  destination = "/etc/postfix/master.cf"
  perms       = 0644
}
