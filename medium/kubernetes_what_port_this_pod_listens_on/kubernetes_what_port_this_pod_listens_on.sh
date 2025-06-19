#!/bin/bash

# Teminal 1

# Peek the target container name
kubectl get pod lonely -n default -o yaml

# Enable shell via an ephemeral container
kubectl debug -it pod/lonely -n default --image=ubuntu --target=app -- sh

######### Inside shell
apt update
apt install -y iproute2
ss -tunl # Obtain the port
exit
#########

# Port forward 8080 to the port (e.g., 17458)
kubectl port-forward pod/lonely 8080:17458 -n default

# Terminal 2

# HTTP request
curl http://localhost:8080