template {
  source      = "/etc/consul-template/templates/archiva/static/jetty-archiva.xml.ctmpl"
  destination = "/var/lib/jetty/etc/jetty-archiva.xml"
  perms       = 0644
}
