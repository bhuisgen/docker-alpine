template {
  source      = "/etc/container.d/templates/nomad/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-nomad"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/nomad/generic/cont-finish.ctmpl"
  destination = "/etc/cont-finish.d/40-nomad"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/nomad/generic/config.hcl.ctmpl"
  destination = "/etc/nomad.d/config.json"
  command     = "/bin/chown nomad:nomad /etc/nomad.d/config.hcl"
  perms       = 0640
}
