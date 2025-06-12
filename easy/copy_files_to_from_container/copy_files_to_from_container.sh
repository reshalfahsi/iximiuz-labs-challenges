#!/usr/bin/env bash

# Copy the config file to the container
docker cp ~/nginx.conf web:/etc/nginx/nginx.conf

# Reload the Nginx configuration
docker exec web nginx -s reload

# Copy the Nginx binary to the host
docker cp web:/usr/sbin/nginx ~/nginx-bin