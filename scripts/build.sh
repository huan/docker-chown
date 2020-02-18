#!/usr/bin/env bash

set -e

docker build -t chown .

echo
echo Smoking test...
echo

docker run chown
