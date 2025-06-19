#!/usr/bin/env bash

# Step 1: Create Network Namespaces
sudo ip netns add netns0
sudo ip netns add netns1

# Step 2: Create a Linux Bridge
sudo ip link add name br0 type bridge

# Step 3: Create Virtual Ethernet (Veth) Pairs

# For netns0
sudo ip link add veth0 type veth peer name ceth0

# For netns1
sudo ip link add veth1 type veth peer name ceth1

# Step 4: Attach Host-side Veth Ends to the Bridge
sudo ip link set veth0 master br0
sudo ip link set veth1 master br0

# Step 5: Move Container-side Veth Ends to Namespaces
sudo ip link set ceth0 netns netns0
sudo ip link set ceth1 netns netns1

# Step 6: Assign IP Addresses
# Using 172.18.0.0/16 for the entire bridge network.

# Assign IP to br0 (Host side - Gateway for namespaces)
sudo ip addr add 172.18.0.1/16 dev br0

# Assign IP to ceth0 (Inside netns0)
sudo ip netns exec netns0 ip addr add 172.18.0.10/16 dev ceth0

# Assign IP to ceth1 (Inside netns1)
sudo ip netns exec netns1 ip addr add 172.18.0.20/16 dev ceth1

# Step 7: Bring All Interfaces Up

# Bring up bridge first
sudo ip link set br0 up

# Bring up host-side veth ends
sudo ip link set veth0 up
sudo ip link set veth1 up

# Bring up container-side veth ends inside their namespaces
sudo ip netns exec netns0 ip link set ceth0 up
sudo ip netns exec netns1 ip link set ceth1 up

# Also bring up loopback in namespaces (good practice)
sudo ip netns exec netns0 ip link set lo up
sudo ip netns exec netns1 ip link set lo up

# Step 8: Configure Default Routes in Namespaces

# Set default route for netns0
sudo ip netns exec netns0 ip route add default via 172.18.0.1

# Set default route for netns1
sudo ip netns exec netns1 ip route add default via 172.18.0.1

# Step 9: Enable IP Forwarding on the Host
sudo sysctl -w net.ipv4.ip_forward=1

# Step 10: Set up Network Address Translation (NAT) on the Host
# On the Linux server (host machine)
sudo iptables -t nat -A POSTROUTING -s 172.18.0.0/16 ! -o br0 -j MASQUERADE