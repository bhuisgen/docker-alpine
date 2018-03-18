template {
    source = "/etc/consul-template/templates/postfix/static/10-postfix.ctmpl"
    destination = "/etc/cont-init.d/10-postfix"
    perms = 0755
}

template {
    source = "/etc/consul-template/templates/postfix/static/main.cf.ctmpl"
    destination = "/etc/postfix/main.cf"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/postfix/static/master.cf.ctmpl"
    destination = "/etc/postfix/master.cf"
    perms = 0644
}
