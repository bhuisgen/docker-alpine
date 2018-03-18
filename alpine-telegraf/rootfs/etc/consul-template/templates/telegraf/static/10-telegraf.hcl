template {
    source = "/etc/consul-template/templates/telegraf/static/telegraf.conf.ctmpl"
    destination = "/usr/local/telegraf/etc/telegraf/telegraf.conf"
    command = "/bin/chown -R root:telegraf /usr/local/telegraf/etc/telegraf"
    perms = 0640
    left_delimiter  = "{{{{"
    right_delimiter = "}}}}"
}
