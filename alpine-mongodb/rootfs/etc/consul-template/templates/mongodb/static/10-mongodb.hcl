template {
    source = "/etc/consul-template/templates/mongodb/static/10-mongodb.ctmpl"
    destination = "/etc/cont-init.d/10-mongodb"
    perms = 0755
}

template {
    source = "/etc/consul-template/templates/mongodb/static/mongod.conf.ctmpl"
    destination = "/etc/mongod.conf"
    perms = 0644
}
