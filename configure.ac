#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([docker-alpine], [0.1], [bhuisgen@hbis.fr])
AM_INIT_AUTOMAKE([foreign])
AM_MAINTAINER_MODE
AM_EXTRA_RECURSIVE_TARGETS([build pull push])

# Checks for programs.
AC_PROG_INSTALL
AC_PROG_MAKE_SET

AC_CHECK_PROG(DOCKER, docker, yes, no)
if test x"$DOCKER" != x"yes" ; then
    AC_MSG_ERROR([required program 'docker' not found])
fi

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_ARG_VAR(TAG, tag of docker images)
AC_MSG_CHECKING([tag of docker images])
if test "x${TAG}" = "x"; then
    AC_SUBST(TAG, latest)
fi
AC_MSG_RESULT([${TAG}])

AC_ARG_VAR(CLEAN_OPTIONS, clean options)
AC_ARG_VAR(BUILD_OPTIONS, build options)
AC_ARG_VAR(PULL_OPTIONS, pull options)

AC_CONFIG_FILES([
    Makefile
    alpine-base/Makefile
    alpine-base-consul/Makefile
    alpine-backup/Makefile
    alpine-backup-mariadb/Makefile
    alpine-backup-postgresql/Makefile
    alpine-backup-rsync/Makefile
    alpine-backup-tar/Makefile
    alpine-build/Makefile
    alpine-build-go/Makefile
    alpine-build-make/Makefile
    alpine-build-make-ansible/Makefile
    alpine-build-make-packer/Makefile
    alpine-build-make-terraform/Makefile
    alpine-build-maven/Makefile
    alpine-build-python/Makefile
    alpine-build-npm/Makefile
    alpine-build-rpi/Makefile
    alpine-build-rpi-go/Makefile
    alpine-build-rpi-make/Makefile
    alpine-build-rpi-python/Makefile
    alpine-build-yarn/Makefile
    alpine-ansible/Makefile
    alpine-archiva/Makefile
    alpine-awscli/Makefile
    alpine-backuppc/Makefile
    alpine-certbot/Makefile
    alpine-cli53/Makefile
    alpine-consul/Makefile
    alpine-consul-cli/Makefile
    alpine-chronograf/Makefile
    alpine-dnsmasq/Makefile
    alpine-dovecot/Makefile
    alpine-docker-compose/Makefile
    alpine-docker-machine/Makefile
    alpine-docker-registry/Makefile
    alpine-drone/Makefile
    alpine-drone-cli/Makefile
    alpine-elasticsearch/Makefile
    alpine-etcd/Makefile
    alpine-fabric/Makefile
    alpine-git/Makefile
    alpine-go/Makefile
    alpine-gogs/Makefile
    alpine-grafana/Makefile
    alpine-haproxy/Makefile
    alpine-hostapd/Makefile
    alpine-hugo/Makefile
    alpine-influxdb/Makefile
    alpine-java/Makefile
    alpine-jenkins/Makefile
    alpine-jenkins-slave/Makefile
    alpine-jetty/Makefile
    alpine-kapacitor/Makefile
    alpine-kibana/Makefile
    alpine-logstash/Makefile
    alpine-mailhog/Makefile
    alpine-mariadb/Makefile
    alpine-ndppd/Makefile
    alpine-nginx/Makefile
    alpine-node-red/Makefile
    alpine-nodejs/Makefile
    alpine-nomad/Makefile
    alpine-opendkim/Makefile
    alpine-opendmarc/Makefile
    alpine-openldap/Makefile
    alpine-openssh/Makefile
    alpine-packer/Makefile
    alpine-perl/Makefile
    alpine-php/Makefile
    alpine-phpmyadmin/Makefile
    alpine-portainer/Makefile
    alpine-postfix/Makefile
    alpine-postgresql/Makefile
    alpine-python/Makefile
    alpine-rabbitmq/Makefile
    alpine-rabbitmqadmin/Makefile
    alpine-redis/Makefile
    alpine-rng/Makefile
    alpine-roundcubemail/Makefile
    alpine-rsyslog/Makefile
    alpine-ruby/Makefile
    alpine-rundeck/Makefile
    alpine-spark/Makefile
    alpine-strongswan/Makefile
    alpine-syncthing/Makefile
    alpine-telegraf/Makefile
    alpine-terraform/Makefile
    alpine-tomcat/Makefile
    alpine-unbound/Makefile
    alpine-vault/Makefile
    alpine-wordpress/Makefile
    alpine-zabbix-agent/Makefile
    alpine-zabbix-frontend-php/Makefile
    alpine-zabbix-java-gateway/Makefile
    alpine-zabbix-monitor/Makefile
    alpine-zabbix-proxy-mysql/Makefile
    alpine-zabbix-proxy-pgsql/Makefile
    alpine-zabbix-proxy-sqlite/Makefile
    alpine-zabbix-server-mysql/Makefile
    alpine-zabbix-server-pgsql/Makefile
])

AC_OUTPUT
