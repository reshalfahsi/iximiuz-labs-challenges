#!/usr/bin/env bash

# Deploy the Pod
kubectl apply -f hoggy-pod.yaml

# Check Pod status
kubectl get pods -w