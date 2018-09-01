template {
  source      = "/etc/consul-template/templates/vault/mysql/config.hcl.ctmpl"
  destination = "/etc/vault.d/config.hcl"
  perms       = 0644
}
