template {
  source      = "/etc/container.d/templates/rabbitmq/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-rabbitmq"
  perms       = 0750
}

template {
  source      = "/etc/container.d/templates/rabbitmq/generic/rabbitmq-env.conf.ctmpl"
  destination = "/usr/local/rabbitmq/etc/rabbitmq/rabbitmq-env.conf"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/rabbitmq/generic/rabbitmq.config.ctmpl"
  destination = "/usr/local/rabbitmq/etc/rabbitmq/rabbitmq.config"
  perms       = 0644
}
