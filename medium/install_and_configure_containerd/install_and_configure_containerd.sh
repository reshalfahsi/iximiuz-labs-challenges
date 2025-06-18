#!/usr/bin/env bash

# Part 1: Obtain relatively fresh containerd binaries

# Go to https://github.com/containerd/containerd/releases. 
# Identify the latest stable release (e.g., 1.7.0 or newer).
CONTAINERD_VERSION="2.1.2"

# Download the tarball
wget https://github.com/containerd/containerd/releases/download/v${CONTAINERD_VERSION}/containerd-${CONTAINERD_VERSION}-linux-amd64.tar.gz

# Extract and place binaries
sudo tar Cxzvf /usr/local containerd-${CONTAINERD_VERSION}-linux-amd64.tar.gz

# Part 2: Start containerd as a systemd service

# Download the systemd unit file
sudo wget https://raw.githubusercontent.com/containerd/containerd/main/containerd.service -O /etc/systemd/system/containerd.service

# Reload systemd, enable, and start containerd
sudo systemctl daemon-reload
sudo systemctl enable --now containerd

# Part 3: Install an OCI-compatible container runtime (runc)

# Find the latest runc release
# Go to https://github.com/opencontainers/runc/releases
VERSION=1.2.4
ARCH=amd64

# Download and Place the binary
sudo curl -L \
    https://github.com/opencontainers/runc/releases/download/v${VERSION}/runc.${ARCH} \
    -o /usr/local/bin/runc

# Make executable
sudo chmod +x /usr/local/bin/runc

# Part 4: Install the CNI plugins and configure a bridge network

# Find the latest CNI plugins release
# Go to https://github.com/containernetworking/plugins/releases
CNI_PLUGINS_VERSION="1.7.1"

# Download the tarball
wget https://github.com/containernetworking/plugins/releases/download/v${CNI_PLUGINS_VERSION}/cni-plugins-linux-amd64-v${CNI_PLUGINS_VERSION}.tgz

# Extract to /opt/cni/bin
sudo mkdir -p /opt/cni/bin
sudo tar Cxzvf /opt/cni/bin cni-plugins-linux-amd64-v${CNI_PLUGINS_VERSION}.tgz

# Create CNI configuration directory
sudo mkdir -p /etc/cni/net.d

# Create the CNI bridge network configuration file
sudo vim /etc/cni/net.d/10-bridge.conf

# Part 5: Start an Nginx container with full networking support using the ctr CLI

# Pull the Nginx image
sudo ctr image pull ghcr.io/iximiuz/labs/nginx:alpine

# Run the Nginx container with CNI enabled
sudo ctr run --cni ghcr.io/iximiuz/labs/nginx:alpine nginx4