#!/bin/bash

echo "Installing Ansible..."
apt-add-repository ppa:ansible/ansible
apt update
apt install -y  ansible > /dev/null
echo "Installing Docker"
apt install -y apt-transport-https ca-certificates curl software-properties-common > /dev/null
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - > /dev/null
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt update > /dev/null
apt-cache policy docker-ce
apt install -y  docker-ce > /dev/null
usermod -aG docker ${USER}
su - ${USER}
echo "Docker compose" 
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr$
chmod +x /usr/local/bin/docker-compose
echo "docker compose version:"`docker-compose --version`

