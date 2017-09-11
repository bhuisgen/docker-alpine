IMAGE = bhuisgen/alpine-build-make-terraform

clean-local:
	docker rmi $(CLEAN_OPTIONS) $(IMAGE):$(TAG) || true

build:
	docker build $(BUILD_OPTIONS) -t $(IMAGE):$(TAG) .

pull:
	docker pull $(PULL_OPTIONS) $(IMAGE):$(TAG)

push: build
	docker push $(PUSH_OPTIONS) $(IMAGE):$(TAG)
