#!/usr/bin/env bash

# Log in to the target registry
docker login registry.iximiuz.com -u iximiuzlabs -p rules!

# Build the container image
docker build -t registry.iximiuz.com/foobar:v1.0.0 ~/projects/foobar

# Push the image
docker push registry.iximiuz.com/foobar:v1.0.0

# Verify (Optional)
# docker logout registry.iximiuz.com
# docker pull registry.iximiuz.com/foobar:v1.0.0