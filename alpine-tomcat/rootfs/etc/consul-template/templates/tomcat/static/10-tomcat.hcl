template {
    source = "/etc/consul-template/templates/tomcat/static/setenv.sh.ctmpl"
    destination = "/usr/local/tomcat/bin/setenv.sh"
    perms = 0755
}

template {
    source = "/etc/consul-template/templates/tomcat/static/catalina.policy.ctmpl"
    destination = "/usr/local/tomcat/conf/catalina.policy"
    perms = 0400
}

template {
    source = "/etc/consul-template/templates/tomcat/static/catalina.properties.ctmpl"
    destination = "/usr/local/tomcat/conf/catalina.properties"
    perms = 0400
}

template {
    source = "/etc/consul-template/templates/tomcat/static/context.xml.ctmpl"
    destination = "/usr/local/tomcat/conf/context.xml"
    perms = 0400
}

template {
    source = "/etc/consul-template/templates/tomcat/static/jmxremote.access.ctmpl"
    destination = "/usr/local/tomcat/conf/jmxremote.access"
    perms = 0400
}

template {
    source = "/etc/consul-template/templates/tomcat/static/jmxremote.password.ctmpl"
    destination = "/usr/local/tomcat/conf/jmxremote.password"
    perms = 0400
}

template {
    source = "/etc/consul-template/templates/tomcat/static/logging.properties.ctmpl"
    destination = "/usr/local/tomcat/conf/logging.properties"
    perms = 0400
}

template {
    source = "/etc/consul-template/templates/tomcat/static/server.xml.ctmpl"
    destination = "/usr/local/tomcat/conf/server.xml"
    perms = 0400
}

template {
    source = "/etc/consul-template/templates/tomcat/static/tomcat-users.xml.ctmpl"
    destination = "/usr/local/tomcat/conf/tomcat-users.xml"
    perms = 0400
}

template {
    source = "/etc/consul-template/templates/tomcat/static/web.xml.ctmpl"
    destination = "/usr/local/tomcat/conf/web.xml"
    perms = 0400
}
