template {
    source = "/etc/consul-template/templates/mariadb/static/10-mariadb.ctmpl"
    destination = "/etc/cont-init.d/10-mariadb"
    perms = 0755
}
