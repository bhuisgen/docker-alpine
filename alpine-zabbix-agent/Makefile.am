IMAGE = bhuisgen/alpine-zabbix-agent

all-local: build

clean-local:
	docker rmi $(IMAGE):$(TAG) || true

build:
	docker build -t $(IMAGE):$(TAG) .

pull:
	docker pull $(IMAGE):$(TAG)
