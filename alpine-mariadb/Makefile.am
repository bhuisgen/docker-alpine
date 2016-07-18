IMAGE = bhuisgen/alpine-mariadb

all-local: build

clean-local:
	docker rmi $(IMAGE):$(TAG) || true

build-local:
	docker build -t $(IMAGE):$(TAG) .

pull-local:
	docker pull $(IMAGE):$(TAG)
