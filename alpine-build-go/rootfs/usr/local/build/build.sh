#!/usr/bin/env bash

trap 'exit 2' ERR INT TERM

eval go build ${GOBUILD_OPTIONS}
