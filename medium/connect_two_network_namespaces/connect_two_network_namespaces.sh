#!/usr/bin/env bash

# Step 1: Create a Virtual Ethernet (Veth) Pair
sudo ip link add veth0 type veth peer name ceth0

# Optional: You can verify that veth0 now exists on the host
# ip link show veth0

# Step 2: Move ceth0 to the container-1 Network Namespace
sudo ip link set ceth0 netns container-1

# Optional: Verify:
# - This should now fail or not show ceth0 in the host's default namespace
# ip link show ceth0
# - This should show ceth0 inside container-1
# sudo ip netns exec container-1 ip link show ceth0 

# Step 3: Assign IP Addresses to Both Ends

# Assign IP to veth0 (Host side)
sudo ip addr add 192.168.10.1/24 dev veth0
# Assign IP to ceth0 (Container side)
sudo ip netns exec container-1 ip addr add 192.168.10.2/24 dev ceth0

# Step 4: Bring Both Interfaces Up

# Bring veth0 up (Host side)
sudo ip link set veth0 up

# Bring ceth0 up (Container side)
sudo ip netns exec container-1 ip link set ceth0 up

# Step 5: Verify Connectivity (Optional)
# From Host to Container
# ping -c 4 192.168.10.2
# From Container to Host
# sudo ip netns exec container-1 ping -c 4 192.168.10.1