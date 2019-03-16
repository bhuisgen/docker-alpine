template {
  source      = "/etc/container.d/templates/mariadb/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-mariadb"
  perms       = 0750
}
