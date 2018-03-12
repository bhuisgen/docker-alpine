template {
    source = "/etc/consul-template/templates/openssh/static/10-openldap.ctmpl"
    destination = "/etc/cont-init.d/10-openldap"
    perms = 0755
}

template {
    source = "/etc/consul-template/templates/openldap/static/slapd.conf.ctmpl"
    destination = "/etc/openldap/slapd.conf"
    command = "/bin/chown root:ldap /etc/openldap/slapd.conf"
    perms = 0640
}
