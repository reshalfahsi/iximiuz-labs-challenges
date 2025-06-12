#!/usr/bin/env bash

# To get the container's name: "web-server"
docker ps

# Replace "Hello World" with "Hello Labs"
docker exec web-server sed -i 's/Hello World/Hello Labs/g' /var/www/html/index.html

# Add "Practice for the win!"
docker exec web-server sed -i '$a Practice for the win!' /var/www/html/index.html