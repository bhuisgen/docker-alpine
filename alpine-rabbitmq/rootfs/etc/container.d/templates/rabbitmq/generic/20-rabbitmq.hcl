template {
  source      = "/etc/container.d/templates/rabbitmq/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-rabbitmq"
  perms       = 0750
}

template {
  source      = "/etc/container.d/templates/rabbitmq/generic/rabbitmq-env.conf.ctmpl"
  destination = "/var/lib/rabbitmq/config/rabbitmq-env.conf"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/rabbitmq/generic/advanced.config.ctmpl"
  destination = "/var/lib/rabbitmq/config/advanced.config"
  perms       = 0644
}
