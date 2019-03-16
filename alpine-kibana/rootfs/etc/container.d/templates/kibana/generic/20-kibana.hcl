template {
  source      = "/etc/container.d/templates/kibana/generic/kibana.yml.ctmpl"
  destination = "/usr/local/kibana/config/kibana.yml"
  perms       = 0644
}
