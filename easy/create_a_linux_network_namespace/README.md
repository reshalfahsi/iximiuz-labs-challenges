# ** Create a Linux Network Namespace **

Docker (and the like) gives the containerized application the illusion of running in a dedicated network environment. This is achieved by using Linux network namespaces that provide a fully isolated set of network devices, IP protocol stacks, routing tables, firewall rules, etc., for each container.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/linux-network-namespace/__static__/network-namespace.png" alt="network-namespace" > 
</p>

In this challenge, you'll need to create a new network namespace manually and then inspect its network interfaces.

First, create a new network namespace called ``my-net-ns``.

Now, list the network interfaces of the ``my-net-ns`` namespace. How many interfaces a freshly created network namespace has? Store the output of ``ip link ls`` in the ``/tmp/my-net-ns-interfaces.txt`` file.

## ** Source **

[Create a Linux Network Namespace](https://labs.iximiuz.com/challenges/linux-network-namespace)

## **[Back to Home](../../)**