template {
  source          = "/etc/container.d/templates/telegraf/generic/telegraf.conf.ctmpl"
  destination     = "/usr/local/telegraf/etc/telegraf/telegraf.conf"
  command         = "/bin/chown -R telegraf:telegraf /usr/local/telegraf/etc/telegraf"
  perms           = 0640
  left_delimiter  = "{{{{"
  right_delimiter = "}}}}"
}
