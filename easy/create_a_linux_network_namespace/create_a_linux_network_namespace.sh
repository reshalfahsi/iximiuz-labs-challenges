sudo ip netns add my-net-ns
sudo ip netns exec my-net-ns ip link > /tmp/my-net-ns-interfaces.txt