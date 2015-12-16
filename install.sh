#! /bin/bash

# exit if a command fails
set -e

version="$1"

# Need build tools
apt-get update && apt-get install -y build-essential

# Build and install
cd beanstalkd-$version
make
cp beanstalkd /usr/bin

# Minimize image size
# Remove unnecessary tools
apt-get remove --purge -y build-essential && apt-get autoclean && apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
