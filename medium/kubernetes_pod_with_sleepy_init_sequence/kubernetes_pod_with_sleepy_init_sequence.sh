#!/usr/bin/env bash

# Examine the Pod Spec and Status
kubectl get pod sleepy -n challenge -o yaml > sleepy-pod.yaml

# Review Logs
kubectl logs -n challenge sleepy -c sleepy-sidecar
kubectl logs -n challenge sleepy -c app

# Modify the Pod Spec
vim sleepy-pod.yaml

# Apply the Fixed Pod Spec
kubectl delete pod sleepy -n challenge
kubectl apply -f sleepy-pod.yaml -n challenge