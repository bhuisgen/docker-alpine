#!/bin/sh

sudo sysctl net.ipv4.ip_forward=1

sudo iptables -t nat -A POSTROUTING -o docker0 -j MASQUERADE
sudo iptables -A FORWARD -i docker0 -o wlx74da386015cd -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlx74da386015cd -o docker0 -j ACCEPT
