template {
  source      = "/etc/container.d/templates/zabbix-server/generic/zabbix_server.conf.ctmpl"
  destination = "/etc/zabbix/zabbix_server.conf"
  perms       = 0644
}
