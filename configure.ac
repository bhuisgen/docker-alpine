#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([docker-alpine], [0.1], [bhuisgen@hbis.fr])
AM_INIT_AUTOMAKE([foreign])
AM_MAINTAINER_MODE
AM_EXTRA_RECURSIVE_TARGETS([build pull])

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
    alpine-build/Makefile
    alpine-build-make/Makefile
    alpine-build-make-terraform/Makefile
    alpine-build-maven/Makefile
    alpine-build-npm/Makefile
    alpine-consul/Makefile
    alpine-dnsmasq/Makefile
    alpine-dynamodb/Makefile
    alpine-elasticsearch/Makefile
    alpine-haproxy/Makefile
    alpine-hostapd/Makefile
    alpine-java/Makefile
    alpine-jenkins/Makefile
    alpine-jetty/Makefile
    alpine-kibana/Makefile
    alpine-logstash/Makefile
    alpine-mariadb/Makefile
    alpine-nginx/Makefile
    alpine-nodejs/Makefile
    alpine-postgresql/Makefile
    alpine-rabbitmq/Makefile
    alpine-redis/Makefile
    alpine-registry/Makefile
    alpine-strongswan/Makefile
    alpine-tomcat/Makefile
    alpine-unbound/Makefile
    alpine-zabbix-agent/Makefile
])

AC_OUTPUT
