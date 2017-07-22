#!/usr/bin/env bash

set -euo pipefail

if [ -n `which docker` ]; then
    echo 'Docker is already installed'
    exit 0
fi

# Remove old versions of docker
sudo apt-get remove docker docker-engine

sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# verifying fingerprint??

ARCH="$(sudo dpkg --print-architecture)"
if [ "$ARCH" = 'armhf' ]
then
    # armhf
    sudo add-apt-repository \
         "deb [arch=armhf] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
else
    # by default use amd64
    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
fi


sudo apt-get update && sudo apt-get install docker-ce

# Create docker group and login
sudo usermod -aG docker $USER
newgrp docker
