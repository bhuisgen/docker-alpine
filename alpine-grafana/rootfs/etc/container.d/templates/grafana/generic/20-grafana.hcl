template {
  source      = "/etc/container.d/templates/grafana/generic/custom.ini.ctmpl"
  destination = "/usr/local/grafana/conf/custom.ini"
  perms       = 0644
}
