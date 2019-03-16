template {
  source      = "/etc/container.d/templates/archiva/generic/jetty-archiva.xml.ctmpl"
  destination = "/var/lib/jetty/etc/jetty-archiva.xml"
  perms       = 0644
}
