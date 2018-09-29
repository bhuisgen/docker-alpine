template {
  source      = "/etc/consul-template/templates/rundeck/static/rundeck-config.properties.ctmpl"
  destination = "/home/rundeck/server/config/rundeck-config.properties"
  perms       = 0644
}
