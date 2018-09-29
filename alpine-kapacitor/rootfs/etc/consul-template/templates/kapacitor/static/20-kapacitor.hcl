template {
  source          = "/etc/consul-template/templates/kapacitor/static/kapacitor.conf.ctmpl"
  destination     = "/usr/local/kapacitor/etc/kapacitor/kapacitor.conf"
  command         = "/bin/chown -R root:kapacitor /usr/local/kapacitor/etc/kapacitor"
  perms           = 0640
  left_delimiter  = "{{{{"
  right_delimiter = "}}}}"
}
