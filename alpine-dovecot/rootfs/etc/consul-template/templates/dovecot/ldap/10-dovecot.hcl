template {
    source = "/etc/consul-template/templates/dovecot/ldap/dovecot.conf.ctmpl"
    destination = "/etc/dovecot/dovecot.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/dovecot-ldap.conf.ext.ctmpl"
    destination = "/etc/dovecot/dovecot-ldap.conf.ext"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/10-auth.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/10-auth.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/10-director.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/10-director.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/10-logging.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/10-logging.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/10-mail.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/10-mail.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/10-master.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/10-master.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/10-ssl.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/10-ssl.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/15-lda.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/15-lda.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/15-mailboxes.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/15-mailboxes.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/20-imap.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/20-imap.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/20-lmtp.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/20-lmtp.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/20-managesieve.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/10-managesieve.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/20-pop3.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/20-pop3.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/90-acl.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/90-acl.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/90-plugin.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/90-plugin.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/90-quota.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/90-quota.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/90-sieve.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/90-sieve.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/90-sieve-extprograms.conf.ctmpl"
    destination = "/etc/dovecot/conf.d/90-sieve-extprograms.conf"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/auth-deny.conf.ext.ctmpl"
    destination = "/etc/dovecot/conf.d/auth-deny.conf.ext"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/dovecot/ldap/conf.d/auth-ldap.conf.ext.ctmpl"
    destination = "/etc/dovecot/conf.d/auth-ldap.conf.ext"
    command = "/bin/sh -c 'test -d /var/run/s6/services/dovecot && doveadm reload || true'"
    perms = 0644
}
