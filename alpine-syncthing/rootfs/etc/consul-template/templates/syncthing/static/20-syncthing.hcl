template {
  source      = "/etc/consul-template/templates/syncthing/static/10-syncthing.ctmpl"
  destination = "/etc/cont-init.d/10-syncthing"
  perms       = 0755
}
