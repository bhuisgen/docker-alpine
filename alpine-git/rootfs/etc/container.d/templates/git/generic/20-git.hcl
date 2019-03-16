template {
  source      = "/etc/container.d/templates/git/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-git"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/git/generic/sshd_config.ctmpl"
  destination = "/etc/ssh/sshd_config"
  perms       = 0644
}
