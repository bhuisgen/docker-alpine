template {
  source      = "/etc/container.d/templates/php/generic/php.ini.ctmpl"
  destination = "/etc/php7/php.ini"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/php/generic/www.conf.ctmpl"
  destination = "/etc/php7/php-fpm.d/www.conf"
  perms       = 0644
}
