#!/usr/bin/env bash

# build docker images
cat <<'EOF' > Dockerfile
FROM alpine

USER 101
EOF

docker build -t registry.iximiuz.com/my-debugging-image:v4.2.0 .

docker push registry.iximiuz.com/my-debugging-image:v4.2.0

# Starts an interactive shell in a new ephemeral alpine container in 
# the non-root pod, which is attached to the app container's 
# uts, ipc, net, and pid namespaces.
#
# pid namespace sharing, enabled by the --target option
kubectl debug -it \
    --image registry.iximiuz.com/my-debugging-image:v4.2.0 \
    --target app non-root \
    -- sh -c 'kill -SIGUSR1 $(pgrep server)'