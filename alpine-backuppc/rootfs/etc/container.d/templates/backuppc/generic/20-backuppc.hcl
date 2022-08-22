template {
  source      = "/etc/container.d/templates/backuppc/generic/cont-init.ctmpl"
  destination = "/etc/cont-init.d/40-backuppc"
  perms       = 0755
}

template {
  source      = "/etc/container.d/templates/backuppc/generic/msmtprc.ctmpl"
  destination = "/var/lib/backuppc/.msmtprc"
  perms       = 0600
}
