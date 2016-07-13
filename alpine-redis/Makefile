# Makefile

IMAGE := bhuisgen/alpine-redis

ifneq ($(REPOSITORY),)
IMAGE := $(REPOSITORY)/$(IMAGE)
endif

ifeq ($(TAG),)
TAG := latest
endif

.PHONY: all build clean pull

all: clean build

clean:
	docker rmi ${IMAGE}:$(TAG) || true

build:
	docker build -t ${IMAGE}:$(TAG) . || false

pull:
	docker pull ${IMAGE}:$(TAG) || false
