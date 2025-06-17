#!/usr/bin/env bash

# Step 1: Navigate to the application directory
cd ~/app

# Step 2: Create the Dockerfile
vim Dockerfile

# Step 3: Build the Docker Image
# This script should contain: docker build -t registry.iximiuz.com/app:v1.0.0 .
npm run docker:build
# docker build -t registry.iximiuz.com/app:v1.0.0 .

# Step 4: Run the Container
# This script should contain: docker run --name nextjs-app -p 3000:3000 -d registry.iximiuz.com/app:v1.0.0
# npm run docker:run
# docker run --name nextjs-app -p 3000:3000 -d registry.iximiuz.com/app:v1.0.0