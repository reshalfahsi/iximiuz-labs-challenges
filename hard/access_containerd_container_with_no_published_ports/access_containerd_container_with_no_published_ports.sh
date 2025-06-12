#!/usr/bin/env bash

# Identify the container’s PID
sudo ctr container ls
sudo lsns -t net

# Enter the container’s network namespace
# Replace PID with the actual process ID (e.g., 1426).
sudo nsenter --target PID --net

# Send an HTTP request
wget -O - http://127.0.0.1:80