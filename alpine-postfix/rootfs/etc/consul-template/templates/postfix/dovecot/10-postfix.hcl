template {
    source = "/etc/consul-template/templates/postfix/dovecot/10-postfix.ctmpl"
    destination = "/etc/cont-init.d/10-postfix"
    command = "/bin/sh -c 'test -d /var/run/s6/services/postfix && postfix reload || true'"
    perms = 0755
}

template {
    source = "/etc/consul-template/templates/postfix/dovecot/main.cf.ctmpl"
    destination = "/etc/postfix/main.cf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/postfix && postfix reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/postfix/dovecot/master.cf.ctmpl"
    destination = "/etc/postfix/master.cf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/postfix && postfix reload || true'"
    perms = 0644
}
