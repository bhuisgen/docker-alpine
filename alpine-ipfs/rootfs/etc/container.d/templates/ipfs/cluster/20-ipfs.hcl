template {
  source      = "/etc/container.d/templates/ipfs/cluster/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-ipfs"
  perms       = 0755
}
