#!/usr/bin/env bash

# Examine the Pod Spec and Status
kubectl get pod faulty -n challenge -o yaml > faulty-pod.yaml

# Modify the Pod Spec
vim faulty-pod.yaml

# Apply the Fixed Pod Spec
kubectl delete pod faulty -n challenge
kubectl apply -f faulty-pod.yaml -n challenge