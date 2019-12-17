#!/bin/bash

# Remove old docker
sudo apt-get remove docker docker-engine docker.io

# Install require
sudo apt-get update
sudo apt-get install --assume-yes linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install --assume-yes \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Insall docker repository
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Installation docker
sudo apt-get update
sudo apt-get install --assume-yes docker-ce

# Install Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo adduser $USER docker 2>&1 > /dev/null 

echo
echo ===========================
echo 
echo Docker : 
echo 
docker -v
docker-compose -v
echo 
echo 'Run this command: "newgrp docker" or reboot'
echo 

