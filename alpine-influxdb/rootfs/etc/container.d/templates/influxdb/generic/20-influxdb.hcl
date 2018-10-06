template {
  source      = "/etc/container.d/templates/influxdb/generic/influxdb.conf.ctmpl"
  destination = "/usr/local/influxdb/etc/influxdb/influxdb.conf"
  perms       = 0644
}
