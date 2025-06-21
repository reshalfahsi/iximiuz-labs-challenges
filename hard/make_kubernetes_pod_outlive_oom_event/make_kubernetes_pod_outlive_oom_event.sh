#!/usr/bin/env bash

vim disable-memory-oom-group-daemonset.yaml
vim herder-deployment.yaml

kubectl apply -f disable-memory-oom-group-daemonset.yaml
kubectl apply -f herder-deployment.yaml