template {
    source = "/etc/consul-template/templates/consul/static/config.hcl.ctmpl"
    destination = "/etc/consul.d/config.hcl"
    command = "/bin/chown root:consul /etc/consul.d/config.hcl"
    perms = 0640
}
