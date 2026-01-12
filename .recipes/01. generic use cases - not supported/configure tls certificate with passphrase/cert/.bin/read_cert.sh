#!/usr/bin/env bash

cd ..

if [ -e 'cert.pem' ]; then
  openssl x509 -in cert.pem -noout -text
fi
