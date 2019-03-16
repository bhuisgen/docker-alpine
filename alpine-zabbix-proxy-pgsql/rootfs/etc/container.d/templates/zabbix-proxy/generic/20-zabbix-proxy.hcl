template {
  source      = "/etc/container.d/templates/zabbix-proxy/generic/zabbix_proxy.conf.ctmpl"
  destination = "/etc/zabbix/zabbix_proxy.conf"
  perms       = 0644
}
