template {
  source      = "/etc/container.d/templates/rspamd/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-rspamd"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/rspamd/generic/local.d/logging.inc.ctmpl"
  destination = "/etc/rspamd/local.d/logging.inc"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/rspamd/generic/local.d/worker-proxy.inc.ctmpl"
  destination = "/etc/rspamd/local.d/worker-proxy.inc"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/rspamd/generic/override.d/milter_headers.conf.ctmpl"
  destination = "/etc/rspamd/override.d/milter_headers.conf"
  perms       = 0755
}
