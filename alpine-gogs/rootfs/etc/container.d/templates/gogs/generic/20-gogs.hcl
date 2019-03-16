template {
  source      = "/etc/container.d/templates/gogs/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-gogs"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/gogs/generic/sshd_config.ctmpl"
  destination = "/etc/ssh/sshd_config"
  perms       = 0644
}
