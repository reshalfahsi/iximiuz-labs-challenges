#!/usr/bin/env bash

# Part 1: Tag the image as registry.iximiuz.com/nginx:foo

# List existing images to identify the Nginx image
# e.g., ghcr.io/iximiuz/labs/nginx:alpine
sudo ctr images ls

# Tag the image with the new name
sudo ctr images tag ghcr.io/iximiuz/labs/nginx:alpine registry.iximiuz.com/nginx:foo

# Part 2: Push the image to the registry.iximiuz.com/nginx repository
sudo ctr images push --user iximiuzlabs:rules! --platform amd64 registry.iximiuz.com/nginx:foo

# Part 3: Remove all traces of the local image from the playground
# Remove the new tag
sudo ctr images rm registry.iximiuz.com/nginx:foo

# Remove the original tag
sudo ctr images rm ghcr.io/iximiuz/labs/nginx:alpine