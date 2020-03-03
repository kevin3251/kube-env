#!/bin/bash

set -e

# Updating and Upgrading dependencies
sudo apt-get update -y -qq  > /dev/null

# Install necessary libraries
sudo apt-get install -y -q  wget curl git build-essential

VERSION=1.14
OS=linux
ARCH=amd64
wget -q https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz
sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

# Setting the golang environment
echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> ~/.profile
echo "GOPATH=$HOME/go" >> ~/.profile
echo "GOBIN=$HOME/go/bin" >> ~/.profile
rm -rf go$VERSION.$OS-$ARCH.tar.gz


# install k3s
curl -sfL https://get.k3s.io | sh -
