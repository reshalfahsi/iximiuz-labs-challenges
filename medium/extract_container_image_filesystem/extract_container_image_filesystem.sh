#!/usr/bin/env bash

# Step 1: Identify the docker image
docker images

# Step 2: Create a temporary container
docker create --name temp_fs_extractor ghcr.io/iximiuz/labs/redis sleep infinity

# Step 3: Start the temporary container
docker start temp_fs_extractor

# Step 4: Copy the filesystem out

# First, ensure the destination directory exists
mkdir -p ~/imagefs

# Then, perform the copy
docker cp temp_fs_extractor:/ ~/imagefs

# Step 5: Clean up (Optional)
# docker stop temp_fs_extractor
# docker rm temp_fs_extractor