#!/usr/bin/env bash

# Discover the Unmounted Drive
lsblk -f

# Create a Mount Point
sudo mkdir /mnt/my-hidden-drive

# Mount the Drive to the Filesystem
sudo mount /dev/vdb /mnt/my-hidden-drive

# Capture the Flag from the Mounted Drive
ls -F /mnt/my-hidden-drive
cat /mnt/my-hidden-drive/flag.txt