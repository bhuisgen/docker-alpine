template {
    source = "/etc/consul-template/templates/openssh/static/10-openssh.ctmpl"
    destination = "/etc/cont-init.d/10-openssh"
    perms = 0755
}

template {
    source = "/etc/consul-template/templates/openssh/static/sshd_config.ctmpl"
    destination = "/etc/ssh/sshd_config"
    perms = 0644
}
