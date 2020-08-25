#!/bin/bash

echo "Installing Ansible..."
apt-add-repository ppa:ansible/ansible
apt update
apt install -y  ansible
echo "Installing Docker"
apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt update
apt-cache policy docker-ce
apt install -y  docker-ce
usermod -aG docker ${USER}
su - ${USER}
echo "Docker compose"
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
echo "docker compose version:"`docker-compose --version`
