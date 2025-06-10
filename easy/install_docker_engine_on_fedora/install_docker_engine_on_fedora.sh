#!/usr/bin/env bash

# runc installation
sudo dnf install -y runc

# containerd installation
wget https://github.com/containerd/containerd/releases/download/v1.6.8/containerd-1.6.8-linux-amd64.tar.gz
sudo tar Cxzvf /usr/local containerd-1.6.8-linux-amd64.tar.gz

# dockerd installation
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# run containerd and docker
sudo systemctl start containerd
sudo systemctl start docker

# add user to group
sudo usermod -aG docker $USER