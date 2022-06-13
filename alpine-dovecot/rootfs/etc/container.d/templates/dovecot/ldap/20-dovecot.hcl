template {
  source      = "/etc/container.d/templates/dovecot/ldap/dovecot.conf.ctmpl"
  destination = "/etc/dovecot/dovecot.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/dovecot.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/dovecot-ldap.conf.ext.ctmpl"
  destination = "/etc/dovecot/dovecot-ldap.conf.ext"
  command     = "/bin/chown root:dovecot /etc/dovecot/dovecot-ldap.conf.ext && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0640
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/10-auth.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/10-auth.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/10-auth.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/10-director.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/10-director.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/10-director.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/10-logging.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/10-logging.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/10-logging.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/10-mail.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/10-mail.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/10-mail.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/10-master.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/10-master.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/10-master.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/10-ssl.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/10-ssl.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/10-ssl.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/15-lda.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/15-lda.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/15-lda.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/15-mailboxes.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/15-mailboxes.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/15-mailboxes.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/20-imap.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/20-imap.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/20-imap.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/20-lmtp.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/20-lmtp.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/20-lmtp.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/20-managesieve.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/10-managesieve.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/10-managesieve.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/20-pop3.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/20-pop3.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/20-pop3.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/90-acl.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/90-acl.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/90-acl.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/90-plugin.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/90-plugin.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/90-plugin.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/90-quota.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/90-quota.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/90-quota.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/90-sieve.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/90-sieve.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/90-sieve.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/90-sieve-extprograms.conf.ctmpl"
  destination = "/etc/dovecot/conf.d/90-sieve-extprograms.conf"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/90-sieve-extprograms.conf && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/auth-deny.conf.ext.ctmpl"
  destination = "/etc/dovecot/conf.d/auth-deny.conf.ext"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/auth-deny.conf.ext && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/dovecot/ldap/conf.d/auth-ldap.conf.ext.ctmpl"
  destination = "/etc/dovecot/conf.d/auth-ldap.conf.ext"
  command     = "/bin/chown root:dovecot /etc/dovecot/conf.d/auth-ldap.conf.ext && /bin/sh -c 'test -d /run/service/dovecot && doveadm reload || true'"
  perms       = 0644
}
