template {
  source      = "/etc/consul-template/templates/docker-registry/static/config.yml.ctmpl"
  destination = "/etc/docker-registry/config.yml"
  perms       = 0644
}
