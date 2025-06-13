#!/usr/bin/env bash

# Part 1: Pull an nginx image from Docker Hub
sudo ctr images pull docker.io/library/nginx:latest

# Part 2: Pull an image from Google Container Registry (GCR)
sudo ctr images pull gcr.io/distroless/static-debian12:latest

# Part 3: Pull an image from GitHub Container Registry (GHCR)
sudo ctr images pull ghcr.io/graalvm/jdk:latest