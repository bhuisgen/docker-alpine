template {
    source = "/etc/cont-consul/templates/service.json.ctmpl"
    destination = "/etc/cont-consul/services.d/container.json"
    perms = 0640
}

template {
    source = "/etc/cont-consul/templates/check-http.json.ctmpl"
    destination = "/etc/cont-consul/checks.d/container-http.json"
    perms = 0640
}

template {
    source = "/etc/cont-consul/templates/check-script.json.ctmpl"
    destination = "/etc/cont-consul/checks.d/container-script.json"
    perms = 0640
}

template {
    source = "/etc/cont-consul/templates/check-tcp.json.ctmpl"
    destination = "/etc/cont-consul/checks.d/container-tcp.json"
    perms = 0640
}

template {
    source = "/etc/cont-consul/templates/check-ttl.json.ctmpl"
    destination = "/etc/cont-consul/checks.d/container-ttl.json"
    perms = 0640
}
