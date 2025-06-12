#!/usr/bin/env bash

# Log in to the target registry
docker login registry.iximiuz.com -u iximiuzlabs -p rules!

# Pull the source image
docker pull ghcr.io/iximiuz/labs/nginx:alpine

# Tag the image
docker tag ghcr.io/iximiuz/labs/nginx:alpine registry.iximiuz.com/third-party/nginx:alpine

# Push the image
docker push registry.iximiuz.com/third-party/nginx:alpine

# Verify (Optional)
# docker logout registry.iximiuz.com
# docker pull registry.iximiuz.com/third-party/nginx:alpine