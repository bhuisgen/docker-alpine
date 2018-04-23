template {
    source = "/etc/consul-template/templates/portainer/static/10-portainer.ctmpl"
    destination = "/etc/cont-init.d/10-portainer"
    perms = 0755
}
