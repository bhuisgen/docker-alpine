template {
    source = "/etc/consul-template/templates/php/static/php.ini.ctmpl"
    destination = "/etc/php7/php.ini"
    perms = 0644
}

template {
    source = "/etc/consul-template/templates/php/static/www.conf.ctmpl"
    destination = "/etc/php7/php-fpm.d/www.conf"
    perms = 0644
}
