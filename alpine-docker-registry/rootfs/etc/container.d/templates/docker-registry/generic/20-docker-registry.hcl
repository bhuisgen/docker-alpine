template {
  source      = "/etc/container.d/templates/docker-registry/generic/config.yml.ctmpl"
  destination = "/etc/docker-registry/config.yml"
  command     = "/bin/chown root:docker-registry /etc/docker-registry/config.yml"
  perms       = 0640
}
