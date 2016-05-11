#!/usr/bin/with-contenv sh

checks=$(curl -sSL http://${CONSUL_AGENT}:${CONSUL_PORT}/v1/agent/checks|jq -r '.[].CheckID')
for check in $checks; do
    curl -sSL "http://${CONSUL_AGENT}:${CONSUL_PORT}/v1/agent/check/deregister/$check"
done

services=$(curl -sSL http://${CONSUL_AGENT}:${CONSUL_PORT}/v1/agent/services|jq -r '.[].ID')
for service in $services; do
    curl -sSL "http://${CONSUL_AGENT}:${CONSUL_PORT}/v1/agent/service/deregister/$service"
done
