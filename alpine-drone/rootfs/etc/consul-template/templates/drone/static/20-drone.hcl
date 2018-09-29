template {
  source      = "/etc/consul-template/templates/drone/static/40-drone.ctmpl"
  destination = "/etc/cont-init.d/40-drone"
  perms       = 0755
}
