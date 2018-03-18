template {
    source = "/etc/consul-template/templates/zabbix-agent/static/10-zabbix-agent.ctmpl"
    destination = "/etc/cont-init.d/10-zabbix-agent"
    perms = 0755
}

template {
    source = "/etc/consul-template/templates/zabbix-agent/static/zabbix_agentd.conf.ctmpl"
    destination = "/etc/zabbix/zabbix_agentd.conf"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/zabbix-agent/static/zabbix-docker.conf.ctmpl"
    destination = "/etc/zabbix-docker/zabbix-docker.conf"
    perms = 0644
}
