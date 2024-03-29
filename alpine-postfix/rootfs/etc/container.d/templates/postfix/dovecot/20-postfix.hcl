template {
  source      = "/etc/container.d/templates/postfix/dovecot/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-postfix"
  command     = "/bin/sh -c 'test -d /run/service/postfix && postfix reload || true'"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/postfix/dovecot/main.cf.ctmpl"
  destination = "/etc/postfix/main.cf"
  command     = "/bin/sh -c 'test -d /run/service/postfix && postfix reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/postfix/dovecot/master.cf.ctmpl"
  destination = "/etc/postfix/master.cf"
  command     = "/bin/sh -c 'test -d /run/service/postfix && postfix reload || true'"
  perms       = 0644
}
