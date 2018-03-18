template {
    source = "/etc/consul-template/templates/vault/postgresql/config.hcl.ctmpl"
    destination = "/etc/vault.d/config.hcl"
    perms = 0644
}
