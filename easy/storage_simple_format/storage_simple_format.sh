#!/usr/bin/env bash

# Discover the Empty Drive
lsblk -f

# Format the Drive with Ext4 Filesystem
sudo mkfs.ext4 /dev/vdb

# Mount the Formatted Drive

# First, create the specified mount point directory.
sudo mkdir -p /mnt/my-ext4-drive

# Next, mount the newly formatted drive to this mount point.
sudo mount /dev/vdb /mnt/my-ext4-drive

# Create a Test File
sudo bash -c 'echo "Hello from my new ext4 drive!" > /mnt/my-ext4-drive/hello.txt'