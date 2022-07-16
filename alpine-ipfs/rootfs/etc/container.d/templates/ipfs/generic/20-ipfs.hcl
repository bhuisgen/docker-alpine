template {
  source      = "/etc/container.d/templates/ipfs/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-ipfs"
  perms       = 0755
}
