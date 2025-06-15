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
RUNC_VERSION="1.3.0"

# Download the binary
wget https://github.com/opencontainers/runc/releases/download/v${RUNC_VERSION}/runc.amd64

# Place and make executable
sudo mkdir -p /usr/local/sbin # Ensure this directory exists and is in PATH
sudo mv runc.amd64 /usr/local/sbin/runc
sudo chmod +x /usr/local/sbin/runc

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

#################################################################
#                                                               #
# I have tried these below the last problem won't solve (HELP!) #
#                                                               #
#################################################################

# Enable IP Forwarding and Masquerading (NAT) on the host
# sudo sysctl -w net.ipv4.ip_forward=1
# sudo iptables -t nat -A POSTROUTING -s 172.18.0.0/24 ! -o bridge0 -j MASQUERADE

# Part 5: Start an Nginx container with full networking support using the ctr CLI

# Pull the Nginx image
# sudo ctr images pull ghcr.io/iximiuz/labs/nginx:latest

# Run the Nginx container with CNI enabled
# sudo ctr run --rm --net-host=false --cni ghcr.io/iximiuz/labs/nginx:latest nginx-test
# sudo ctr run -d --net-host=false --cni ghcr.io/iximiuz/labs/nginx:latest nginx-test