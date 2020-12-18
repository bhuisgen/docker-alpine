template {
  source      = "/etc/container.d/templates/postgresql/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-postgresql"
  perms       = 0750
}

template {
  source      = "/etc/container.d/templates/postgresql/generic/postgresql.conf.ctmpl"
  destination = "/var/lib/postgresql/postgresql.conf"
  perms       = 0644
}
