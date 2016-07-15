IMAGE = bhuisgen/alpine-nodejs

all-local: build

clean-local:
	docker rmi $(IMAGE):$(TAG) || true

build:
	docker build -t $(IMAGE):$(TAG) .

pull:
	docker pull $(IMAGE):$(TAG)
