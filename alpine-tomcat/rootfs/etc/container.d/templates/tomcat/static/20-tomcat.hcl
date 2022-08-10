template {
  source      = "/etc/container.d/templates/tomcat/generic/setenv.sh.ctmpl"
  destination = "/usr/local/tomcat/bin/setenv.sh"
  command     = "/bin/chown tomcat:tomcat /usr/local/tomcat/bin/setenv.sh"
  perms       = 0750
}

template {
  source      = "/etc/container.d/templates/tomcat/generic/catalina.policy.ctmpl"
  destination = "/usr/local/tomcat/conf/catalina.policy"
  command     = "/bin/chown tomcat:tomcat /usr/local/tomcat/conf/catalina.policy"
  perms       = 0640
}

template {
  source      = "/etc/container.d/templates/tomcat/generic/catalina.properties.ctmpl"
  destination = "/usr/local/tomcat/conf/catalina.properties"
  command     = "/bin/chown tomcat:tomcat /usr/local/tomcat/conf/catalina.properties"
  perms       = 0640
}

template {
  source      = "/etc/container.d/templates/tomcat/generic/context.xml.ctmpl"
  destination = "/usr/local/tomcat/conf/context.xml"
  command     = "/bin/chown tomcat:tomcat /usr/local/tomcat/conf/context.xml"
  perms       = 0640
}

template {
  source      = "/etc/container.d/templates/tomcat/generic/jmxremote.access.ctmpl"
  destination = "/usr/local/tomcat/conf/jmxremote.access"
  command     = "/bin/chown tomcat:tomcat /usr/local/tomcat/conf/jmxremote.access"
  perms       = 0400
}

template {
  source      = "/etc/container.d/templates/tomcat/generic/jmxremote.password.ctmpl"
  destination = "/usr/local/tomcat/conf/jmxremote.password"
  command     = "/bin/chown tomcat:tomcat /usr/local/tomcat/conf/jmxremote.password"
  perms       = 0400
}

template {
  source      = "/etc/container.d/templates/tomcat/generic/logging.properties.ctmpl"
  destination = "/usr/local/tomcat/conf/logging.properties"
  command     = "/bin/chown tomcat:tomcat /usr/local/tomcat/conf/logging.properties"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/tomcat/generic/server.xml.ctmpl"
  destination = "/usr/local/tomcat/conf/server.xml"
  command     = "/bin/chown tomcat:tomcat /usr/local/tomcat/conf/server.xml"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/tomcat/generic/tomcat-users.xml.ctmpl"
  destination = "/usr/local/tomcat/conf/tomcat-users.xml"
  command     = "/bin/chown tomcat:tomcat /usr/local/tomcat/conf/tomcat-users.xml"
  perms       = 0644
}

template {
  source      = "/etc/container.d/templates/tomcat/generic/web.xml.ctmpl"
  destination = "/usr/local/tomcat/conf/web.xml"
  command     = "/bin/chown tomcat:tomcat /usr/local/tomcat/conf/web.xml"
  perms       = 0644
}
