#!/bin/bash

# Configure Routing on leaf-01 (On leaf-01)
ip route add 10.0.0.0/16 via 192.168.178.2

# Configure Routing on leaf-02 (On leaf-02)
ip route add 192.168.178.0/24 via 10.0.0.2

# Configure the Router to Forward Packets (On router)
sysctl -w net.ipv4.ip_forward=1