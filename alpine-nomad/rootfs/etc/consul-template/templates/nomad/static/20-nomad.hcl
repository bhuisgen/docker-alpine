template {
  source      = "/etc/consul-template/templates/nomad/static/10-nomad_init.ctmpl"
  destination = "/etc/cont-init.d/10-nomad"
  perms       = 0755
}

template {
  source      = "/etc/consul-template/templates/nomad/static/10-nomad_finish.ctmpl"
  destination = "/etc/cont-finish.d/10-nomad"
  perms       = 0755
}

template {
  source      = "/etc/consul-template/templates/nomad/static/config.hcl.ctmpl"
  destination = "/etc/nomad.d/config.json"
  command     = "/bin/chown root:nomad /etc/nomad.d/config.hcl"
  perms       = 0640
}
