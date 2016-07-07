# Makefile

SUBDIRS := alpine-base alpine-base-consul alpine-build alpine-build-java \
	alpine-build-make alpine-build-nodejs alpine-consul alpine-dnsmasq \
	alpine-dynamodb alpine-elasticsearch alpine-haproxy alpine-java \
	alpine-jetty alpine-kibana alpine-logstash alpine-mariadb alpine-nginx \
	alpine-nodejs alpine-postgresql alpine-rabbitmq alpine-redis \
	alpine-registry alpine-tomcat alpine-zabbix-agent

.PHONY: all build clean

all: build

clean:
	-for subdir in $(SUBDIRS); do (cd $$subdir; $(MAKE) clean); done

build:
	-for subdir in $(SUBDIRS); do (cd $$subdir; $(MAKE) build); done
