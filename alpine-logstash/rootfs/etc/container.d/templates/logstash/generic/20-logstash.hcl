template {
  source      = "/etc/container.d/templates/logstash/generic/logstash.yml.ctmpl"
  destination = "/usr/local/logstash/config/logstash.yml"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/logstash/generic/jvm.options.ctmpl"
  destination = "/usr/local/logstash/config/jvm.options"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/logstash/generic/log4j2.properties.ctmpl"
  destination = "/usr/local/logstash/config/log4j2.properties"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/logstash/generic/logstash.conf.ctmpl"
  destination = "/usr/local/logstash/config/logstash.conf"
  perms       = 0644
}
