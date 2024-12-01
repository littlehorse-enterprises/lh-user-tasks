#!/bin/bash

set -e

if ! command -v openssl &> /dev/null; then
    echo "openssl command could not be found, install https://www.openssl.org/"
    exit 1
fi

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
cd "$SCRIPT_DIR"

SSL_PATH=ssl
rm -rf $SSL_PATH
mkdir -p $SSL_PATH

########################################################
# SSL Certificates
########################################################
echo "Creating SSL Certificates"
openssl req -x509 -sha256 -nodes \
    -days 3650 -newkey rsa:2048 \
    -subj '/O=LH User Tasks/CN=localhost' \
    -keyout "$SSL_PATH/key.pem" \
    -out "$SSL_PATH/cert.pem" \
    -addext "subjectAltName = DNS:localhost" > /dev/null 2>&1

echo "Certificates generated successfully in $SSL_PATH/"
echo "- cert.pem: SSL certificate"
echo "- key.pem: Private key"