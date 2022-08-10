template {
  source          = "/etc/container.d/templates/kapacitor/generic/kapacitor.conf.ctmpl"
  destination     = "/usr/local/kapacitor/etc/kapacitor/kapacitor.conf"
  command         = "/bin/chown -R kapacitor:kapacitor /usr/local/kapacitor/etc/kapacitor"
  perms           = 0640
  left_delimiter  = "{{{{"
  right_delimiter = "}}}}"
}
