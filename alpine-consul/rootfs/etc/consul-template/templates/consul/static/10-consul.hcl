template {
    source = "/etc/consul-template/templates/consul/static/config.json.ctmpl"
    destination = "/etc/consul.d/config.json"
    command = "/bin/chown root:consul /etc/consul.d/config.json"
    perms = 0640
}

template {
    source = "/etc/consul-template/templates/consul/static/acl.json.ctmpl"
    destination = "/etc/consul.d/acl.json"
    command = "/bin/chown root:consul /etc/consul.d/acl.json"
    perms = 0640
}

template {
    source = "/etc/consul-template/templates/consul/static/domain.json.ctmpl"
    destination = "/etc/consul.d/domain.json"
    command = "/bin/chown root:consul /etc/consul.d/domain.json"
    perms = 0640
}

template {
    source = "/etc/consul-template/templates/consul/static/encrypt.json.ctmpl"
    destination = "/etc/consul.d/encrypt.json"
    command = "/bin/chown root:consul /etc/consul.d/encrypt.json"
    perms = 0640
}

template {
    source = "/etc/consul-template/templates/consul/static/performance.json.ctmpl"
    destination = "/etc/consul.d/performance.json"
    command = "/bin/chown root:consul /etc/consul.d/performance.json"
    perms = 0640
}

template {
    source = "/etc/consul-template/templates/consul/static/tls.json.ctmpl"
    destination = "/etc/consul.d/tls.json"
    command = "/bin/chown root:consul /etc/consul.d/tls.json"
    perms = 0640
}
