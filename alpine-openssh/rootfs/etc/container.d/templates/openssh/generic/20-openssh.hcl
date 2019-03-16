template {
  source      = "/etc/container.d/templates/openssh/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-openssh"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/openssh/generic/sshd_config.ctmpl"
  destination = "/etc/ssh/sshd_config"
  perms       = 0644
}
