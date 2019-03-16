template {
  source      = "/etc/container.d/templates/syncthing/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-syncthing"
  perms       = 0755
}
