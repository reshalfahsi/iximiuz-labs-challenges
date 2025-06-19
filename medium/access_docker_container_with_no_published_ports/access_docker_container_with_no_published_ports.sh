#!/usr/bin/env bash

# Find the Container’s IP Address
docker inspect networking-is-fun | grep IPAddress

# Send an HTTP Request
curl http://172.18.0.2:80