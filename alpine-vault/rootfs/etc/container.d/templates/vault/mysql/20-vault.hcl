template {
  source      = "/etc/container.d/templates/vault/mysql/config.hcl.ctmpl"
  destination = "/etc/vault.d/config.hcl"
  perms       = 0644
}
