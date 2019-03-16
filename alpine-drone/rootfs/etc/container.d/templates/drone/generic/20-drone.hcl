template {
  source      = "/etc/container.d/templates/drone/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-drone"
  perms       = 0755
}
