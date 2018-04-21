template {
    source = "/etc/consul-template/templates/rundeck/static/10-rundeck.ctmpl"
    destination = "/etc/cont-init.d/10-rundeck"
    perms = 0755
}
