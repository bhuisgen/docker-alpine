template {
  source      = "/etc/consul-template/templates/influxdb/static/influxdb.conf.ctmpl"
  destination = "/usr/local/influxdb/etc/influxdb/influxdb.conf"
  perms       = 0640
}
