#!/usr/bin/env bash

# Starts an interactive shell in a new ephemeral alpine container in 
# the slim pod, which is attached to the app container's 
# uts, ipc, net, and pid namespaces.
#
# pid namespace sharing, enabled by the --target option
kubectl debug -it \
    --image ghcr.io/iximiuz/labs/alpine:3 \
    --target app \
    slim

kill -SIGUSR1 $(pgrep server)