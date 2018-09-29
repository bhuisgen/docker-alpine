template {
  source      = "/etc/consul-template/templates/gogs/static/10-gogs.ctmpl"
  destination = "/etc/cont-init.d/10-gogs"
  perms       = 0755
}

template {
  source      = "/etc/consul-template/templates/gogs/static/sshd_config.ctmpl"
  destination = "/etc/ssh/sshd_config"
  perms       = 0644
}
