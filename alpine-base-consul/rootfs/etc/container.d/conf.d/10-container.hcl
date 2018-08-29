template {
  source      = "/etc/container.d/templates/container/service.json.ctmpl"
  destination = "/var/run/container/service.json"
  perms       = 0640
}

template {
  source      = "/etc/container.d/templates/container/check.json.ctmpl"
  destination = "/var/run/container/check.json"
  perms       = 0640
}

template {
  source      = "/etc/container.d/templates/consul-template/10-container.hcl.ctmpl"
  destination = "/etc/consul-template/conf.d/10-container.hcl"
  perms       = 0640
}
