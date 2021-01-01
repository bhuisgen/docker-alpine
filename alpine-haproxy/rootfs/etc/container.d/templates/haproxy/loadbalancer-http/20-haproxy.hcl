template {
  source      = "/etc/container.d/templates/haproxy/loadbalancer-http/haproxy.cfg.ctmpl"
  destination = "/etc/haproxy/haproxy.cfg"
  command     = "/bin/sh -c '/etc/haproxy/reload || true'"
  perms       = 0644
}
