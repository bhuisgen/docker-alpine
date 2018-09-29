template {
  source      = "/etc/consul-template/templates/mariadb/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-mariadb"
  perms       = 0755
}
