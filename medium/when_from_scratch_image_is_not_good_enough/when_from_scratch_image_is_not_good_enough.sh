#!/usr/bin/env bash


# Step 1: Diagnosis

# Send the HTTP request
curl http://localhost:8080

# See docker images information
docker ps

# Step 2: Extract server Binary File
# Extract from existing image, i.e.,
# ghcr.io/iximiuz/labs/from-scratch/status-checker-static:v1.0.0
docker create --name temp-extractor ghcr.io/iximiuz/labs/from-scratch/status-checker-static:v1.0.0
docker cp temp-extractor:/server ./server
docker rm temp-extractor

# Step 3: Build the New Image
docker build -t status-checker-fixed .

# Step 4: Run the New Container

# First, stop and remove any old status-checker container 
# if it's still running.
docker stop status-checker
docker rm status-checker

# Now, run the new container using your fixed image.
docker run --name status-checker -p 8080:8080 -d status-checker-fixed

# Step 5: Verify Functionality (Optional)
# curl http://localhost:8080

# Step 6: Verify Constraints (Optional)

# Image Size < 50MB
# docker images status-checker-fixed

# No Shell in the container
# docker exec -it status-checker sh