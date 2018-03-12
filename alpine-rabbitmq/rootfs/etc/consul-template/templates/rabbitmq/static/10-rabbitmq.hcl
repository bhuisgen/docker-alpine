template {
    source = "/etc/consul-template/templates/rabbitmq/static/10-rabbitmq.ctmpl"
    destination = "/etc/cont-init.d/10-rabbitmq"
    perms = 0755
}


template {
    source = "/etc/consul-template/templates/rabbitmq/static/rabbitmq-env.conf.ctmpl"
    destination = "/usr/local/rabbitmq/etc/rabbitmq/rabbitmq-env.conf"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/rabbitmq/static/rabbitmq.config.ctmpl"
    destination = "/usr/local/rabbitmq/etc/rabbitmq/rabbitmq.config"
    perms = 0644
}
