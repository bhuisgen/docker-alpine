template {
  source      = "/etc/consul-template/templates/postgresql/static/10-postgresql.ctmpl"
  destination = "/etc/cont-init.d/10-postgresql.conf"
  perms       = 0755
}

template {
  source      = "/etc/consul-template/templates/postgresql/static/postgresql.conf.ctmpl"
  destination = "/var/lib/postgresql/data/postgresql.conf"
  perms       = 0755
}
