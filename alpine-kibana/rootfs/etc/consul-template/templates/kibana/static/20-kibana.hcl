template {
  source      = "/etc/consul-template/templates/kibana/static/kibana.yml.ctmpl"
  destination = "/usr/local/kibana/config/kibana.yml"
  perms       = 0644
}
