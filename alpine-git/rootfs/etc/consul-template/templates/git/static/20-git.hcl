template {
  source      = "/etc/consul-template/templates/git/static/10-git.ctmpl"
  destination = "/etc/cont-init.d/10-git"
  perms       = 0755
}

template {
  source      = "/etc/consul-template/templates/git/static/sshd_config.ctmpl"
  destination = "/etc/ssh/sshd_config"
  perms       = 0644
}
