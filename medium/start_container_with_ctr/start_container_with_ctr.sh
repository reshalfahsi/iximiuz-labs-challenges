#!/usr/bin/env bash

# Part 1: Start a container using ctr

# Pull the nginx:alpine image
sudo ctr images pull ghcr.io/iximiuz/labs/nginx:alpine

# Run the nginx:alpine container
sudo ctr run -d ghcr.io/iximiuz/labs/nginx:alpine my-nginx-container

# Part 2: Find the main container's process PID 
# and the ID (inode number) of the network namespace
sudo lsns -t net

# Part 3: Find the container IP address based on PID
# e.g., 2726
sudo nsenter --target 2726 --net ip addr show