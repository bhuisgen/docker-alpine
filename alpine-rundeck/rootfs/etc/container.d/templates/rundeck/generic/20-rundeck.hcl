template {
  source      = "/etc/container.d/templates/rundeck/generic/rundeck-config.properties.ctmpl"
  destination = "/home/rundeck/server/config/rundeck-config.properties"
  perms       = 0644
}
