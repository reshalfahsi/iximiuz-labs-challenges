#!/usr/bin/env bash

# Step 1: Start a Container
docker run -d --name my_nginx nginx

# Step 2: Find the Container ID
# Alternatively: docker ps
docker inspect my_nginx --format '{{.Id}}'

# Step 3: Locate the Main Container Process and Its PID
docker inspect my_nginx --format '{{.State.Pid}}'

# Step 4: Find the Container’s IP Address
docker inspect my_nginx --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'