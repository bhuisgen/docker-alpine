template {
  source      = "/etc/consul-template/templates/php/generic/php.ini.ctmpl"
  destination = "/etc/php7/php.ini"
  perms       = 0644
}

template {
  source      = "/etc/consul-template/templates/php/generic/www.conf.ctmpl"
  destination = "/etc/php7/php-fpm.d/www.conf"
  perms       = 0644
}
