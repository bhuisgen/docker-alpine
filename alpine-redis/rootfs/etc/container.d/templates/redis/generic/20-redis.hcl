template {
  source      = "/etc/container.d/templates/redis/generic/redis.conf.ctmpl"
  destination = "/etc/redis.conf"
  perms       = 0644
}
