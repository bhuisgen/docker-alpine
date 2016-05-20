#!/bin/sh

if [ -f ca-priv-key.pem ] || [ -f ca.pem ] || [ -f serial ] || [ -f certindex ]; then
    echo "CA already generated, aborting"
    exit 1
fi

echo "000a" > serial
touch certindex
openssl genrsa -des3 -out ca-priv-key.pem 2048
openssl req -x509 -new -nodes -key ca-priv-key.pem -sha256 -days 3650 -out ca.pem

