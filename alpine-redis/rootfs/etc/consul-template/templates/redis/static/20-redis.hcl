template {
  source      = "/etc/consul-template/templates/redis/static/redis.conf.ctmpl"
  destination = "/etc/redis.conf"
  perms       = 0644
}
