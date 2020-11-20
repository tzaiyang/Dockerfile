#!/bin/bash

set -xe
#NAME="bionic"
NAME="xenial"
# Fetch base archive and Dockerfile used for the existing Ubuntu 16.04 image
#curl -fLO https://partner-images.canonical.com/core/xenial/current/ubuntu-xenial-core-cloudimg-amd64-root.tar.gz
#curl -fLO https://raw.githubusercontent.com/tianon/docker-brew-ubuntu-core/dist-amd64/xenial/Dockerfile
#curl -fLO https://raw.githubusercontent.com/tianon/docker-brew-ubuntu-core/dist-amd64/bionic/Dockerfile

# Prepare a slimmed down version
gzip -dc ubuntu-xenial-core-cloudimg-amd64-root.tar.gz | tar --delete --wildcards '/var/lib/apt/lists/*' | gzip > rootfs-minimised.tar.gz
sed 's/ubuntu-xenial-core-cloudimg-amd64-root\.tar\.gz/rootfs-minimised\.tar\.gz/' Dockerfile > Dockerfile-new

# Compare the before/after
docker build -t ubuntu-16.04-test:before .
docker build -t ubuntu-16.04-test:after -f Dockerfile-new .
docker images ubuntu-16.04-test
