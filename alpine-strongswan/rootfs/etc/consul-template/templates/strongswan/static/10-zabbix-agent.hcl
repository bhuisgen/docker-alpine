template {
    source = "/etc/consul-template/templates/strongswan/static/10-strongswan_init.ctmpl"
    destination = "/etc/cont-init.d/10-strongswan.conf"
    perms = 0755
}

template {
    source = "/etc/consul-template/templates/strongswan/static/10-strongswan_finish.ctmpl"
    destination = "/etc/cont-finish.d/10-strongswan.conf"
    perms = 0755
}

template {
    source = "/etc/consul-template/templates/strongswan/static/20-strongswan-monitor_init.ctmpl"
    destination = "/etc/cont-init.d/20-strongswan-monitor.conf"
    perms = 0755
}

template {
    source = "/etc/consul-template/templates/strongswan/static/ipsec.conf.ctmpl"
    destination = "/etc/ipsec.conf"
    perms = 0640
}

template {
    source = "/etc/consul-template/templates/strongswan/static/ipsec.secrets.ctmpl"
    destination = "/etc/ipsec.secrets"
    perms = 0640
}
