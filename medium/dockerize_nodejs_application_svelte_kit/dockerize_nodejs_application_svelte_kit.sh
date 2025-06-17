#!/usr/bin/env bash

# Step 1: Navigate to the application directory
cd ~/app

# Step 2: Create the Dockerfile
vim Dockerfile

# Step 3: Build the Docker Image
npm run docker:build

# Step 4: Run the Container
# npm run docker:run