#!/usr/bin/env bash

# Part 1: Copy nginx.conf to the Pod
kubectl cp ~/nginx.conf web:/etc/nginx/nginx.conf -c server

# Part 2: Trigger Nginx to reload its config
kubectl exec web -- nginx -s reload

# Part 3: Copy the Nginx binary from the Pod to the Host
kubectl cp web:/usr/sbin/nginx ~/nginx-bin -c server