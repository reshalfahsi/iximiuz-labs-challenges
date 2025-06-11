#!/usr/bin/env bash

kubectl get deployment memhog -o yaml > memhog_deployment.yaml
kubectl apply -f memhog_deployment.yaml
# Important:
# Kill the previous deployment!
kubectl delete pod memhog-some-unique-chars