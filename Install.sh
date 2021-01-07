#!/bin/bash

# update apt-get
sudo apt-get -y update 

# remove previously installed Docker
sudo apt-get remove docker docker-engine docker.io* lxc-docker*

# install dependencies 4 cert
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common

# add Docker repo gpg key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

echo "deb https://download.docker.com/linux/debian stretch stable" >> /etc/apt/sources.list 


# install Docker
sudo apt-get -y install docker-ce


# manage Docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER

# configure Docker to start on boot
sudo systemctl enable docker

# pulls juice-shop
docker pull bkimminich/juice-shop
