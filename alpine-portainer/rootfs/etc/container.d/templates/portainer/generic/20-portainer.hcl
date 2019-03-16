template {
  source      = "/etc/container.d/templates/portainer/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-portainer"
  perms       = 0755
}
