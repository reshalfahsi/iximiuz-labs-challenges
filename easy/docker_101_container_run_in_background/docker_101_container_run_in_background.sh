#!/usr/bin/env bash

# Start an nginx container in the background
docker run -d --name my-nginx -p 80:80 nginx:latest

# Retrieve the nounce GET parameter from its access log
docker logs my-nginx

# Re-attach to the Nginx container
docker attach my-nginx

# Terminate the container by pressing ^C (ctrl + C)