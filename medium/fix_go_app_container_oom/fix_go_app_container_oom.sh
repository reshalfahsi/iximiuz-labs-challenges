#!/usr/bin/env bash

kubectl get deployment memhog -o yaml > memhog_deployment.yaml
kubectl apply -f memhog_deployment.yaml
# Important:
# - Kill the previous deployment!
# - To see the available pods:
#       kubectl get pods -l app=memhog
kubectl delete pod memhog-some-unique-chars