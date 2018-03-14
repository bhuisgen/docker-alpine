template {
    source = "/etc/consul-template/templates/elasticsearch/static/elasticsearch.yml.ctmpl"
    destination = "/usr/local/elasticsearch/config/elasticsearch.yml"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/elasticsearch/static/jvm.options.ctmpl"
    destination = "/usr/local/elasticsearch/config/jvm.options"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/elasticsearch/static/log4j2.properties.ctmpl"
    destination = "/usr/local/elasticsearch/config/log4j2.properties"
    perms = 0644
}
