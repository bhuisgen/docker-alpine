#!/bin/sh

NAME=$1
if [ -z "$NAME" ]; then
   echo "Missing argument: certificate name"
   exit 1
fi

if [ ! -f ca-priv-key.pem ] || [ ! -f ca.pem ]; then
    echo "CA certificate not generated, aborting"
    exit 2
fi

if [ -f "$NAME-priv-key.pem" ] || [ -f "$NAME-priv-key.pem" ]; then
    echo "Client certificate already generated, aborting"
    exit 3
fi

openssl genrsa -out $NAME-priv-key.pem 2048
openssl req -new -key $NAME-priv-key.pem -out $NAME.csr

openssl ca -batch -config ca.cnf -notext -in $NAME.csr -out $NAME.pem
