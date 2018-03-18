template {
    source = "/etc/consul-template/templates/zabbix-java-gateway/static/run.ctmpl"
    destination = "/etc/services.d/zabbix-java-gateway/run"
    perms = 0755
}

template {
    source = "/etc/consul-template/templates/zabbix-java-gateway/static/jmxremote.access.ctmpl"
    destination = "/usr/share/zabbix/zabbix_java/conf/jmxremote.access"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/zabbix-java-gateway/static/jmxremote.password.ctmpl"
    destination = "/usr/share/zabbix/zabbix_java/conf/jmxremote.password"
    perms = 0644
}
