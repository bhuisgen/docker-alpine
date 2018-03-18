template {
    source = "/etc/consul-template/templates/unbound/static/unbound.conf.ctmpl"
    destination = "/etc/unbound/unbound.conf"
    perms = 0644
}
