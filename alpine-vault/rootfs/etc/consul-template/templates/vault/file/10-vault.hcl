template {
    source = "/etc/consul-template/templates/vault/file/config.hcl.ctmpl"
    destination = "/etc/vault.d/config.hcl"
    perms = 0644
}
