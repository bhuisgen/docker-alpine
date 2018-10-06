template {
  source      = "/etc/container.d/templates/mongodb/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-mongodb"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/mongodb/generic/mongod.conf.ctmpl"
  destination = "/etc/mongod.conf"
  perms       = 0644
}
