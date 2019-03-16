template {
  source      = "/etc/container.d/templates/zabbix-java-gateway/generic/run.ctmpl"
  destination = "/etc/services.d/zabbix-java-gateway/run"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/zabbix-java-gateway/generic/jmxremote.access.ctmpl"
  destination = "/usr/share/zabbix/zabbix_java/conf/jmxremote.access"
  perms       = 0640
}

template {
  source      = "/etc/container.d/templates/zabbix-java-gateway/generic/jmxremote.password.ctmpl"
  destination = "/usr/share/zabbix/zabbix_java/conf/jmxremote.password"
  perms       = 0640
}
