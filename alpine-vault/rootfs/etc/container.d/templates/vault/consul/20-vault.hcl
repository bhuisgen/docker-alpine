template {
  source      = "/etc/container.d/templates/vault/consul/config.hcl.ctmpl"
  destination = "/etc/vault.d/config.hcl"
  perms       = 0644
}
