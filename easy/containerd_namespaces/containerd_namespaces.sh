#!/usr/bin/env bash

# Part 1: Create a new containerd namespace called my-ns
sudo ctr namespaces create my-ns

# Part 2: Run a container in the newly created namespace (my-ns)

# Pull the nginx:alpine image into my-ns
sudo ctr --namespace my-ns images pull docker.io/library/nginx:alpine

# Run the nginx:alpine container in my-ns
sudo ctr --namespace my-ns run -d docker.io/library/nginx:alpine my-nginx-container

# Part 3: Find the labs-are-fun Docker container's task ID

# List containers in the moby namespace
# Docker's default containerd namespace is usually moby.
sudo ctr --namespace moby containers ls

# List tasks in the moby namespace
sudo ctr --namespace moby tasks ls

# Write the task ID to /tmp/labs-are-fun.txt
# e.g., 1c350f9b010df617a00b59bc9207914ea066bfb345653cc213dc4f8668879a38
echo "1c350f9b010df617a00b59bc9207914ea066bfb345653cc213dc4f8668879a38" | sudo tee /tmp/labs-are-fun.txt