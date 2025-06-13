#!/usr/bin/env bash

# Step 1: Ensure you have a local image
sudo ctr images pull docker.io/library/hello-world:latest

# Step 2: Label the image with practice=matter
sudo ctr images label docker.io/library/hello-world:latest practice=matter

# Step 3: Verify the label (Optional)
# sudo ctr images info docker.io/library/hello-world:latest