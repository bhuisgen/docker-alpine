template {
    source = "/etc/consul-template/templates/drone/static/10-drone.ctmpl"
    destination = "/etc/cont-init.d/10-drone"
    perms = 0755
}
