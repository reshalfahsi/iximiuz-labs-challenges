# **Reproduce a Docker Bridge Network Using Basic Linux Commands**

Your task is to reproduce the Docker bridge network from the picture below. This is it, this is the challenge.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/reproduce-docker-bridge-network/__static__/bridge.png" width="400" alt="bridge" > 
</p>

Create two network namespaces representing two containers.

> **Hint #1:**
> 
> Don't know where to start? Try solving this simpler challenge first: [Create a Network Namespace](https://labs.iximiuz.com/challenges/linux-network-namespace).

Connect the two network namespaces with the host network namespace using virtual Ethernet pairs.

> **Hint #2:**
> 
> Solving the [Connect Two Network Namespaces](https://labs.iximiuz.com/challenges/connect-two-network-namespaces) challenge first might help you here.

Add the bridge interface, configure it, and connect the host ends of the virtual Ethernet pairs to the bridge.

Assign IP addresses to the container ends of the virtual Ethernet pairs and configure the routing to allow the host and the containers to communicate. At any given moment:

- The host should be able to ping ``netns0``.
- The host should be able to ping ``netns1``.
- ``netns0`` should be able to ping the host.
- ``netns1`` should be able to ping the host.
- ``netns0`` should be able to ping ``netns1``.
- ``netns1`` should be able to ping ``netns0``.

> **Hint #3:**
>
> The challenge you may want to solve first 👉 [Connect Multiple Network Namespaces](https://labs.iximiuz.com/challenges/connect-multiple-network-namespaces).

Set up Network Address Translation (NAT) on the host to allow the containers to communicate with the outside world.

> **Hint #4:**
>
> [Set Up Network Address Translation (NAT) for a Container](https://labs.iximiuz.com/challenges/set-up-nat-for-container) is a good challenge to solve first.

> **Hint #N:**
>
> The knowledge gap is too big? No worries, we got you covered! After following the [How Container Networking Works - Building a Linux Bridge Network From Scratch](https://labs.iximiuz.com/tutorials/container-networking-from-scratch) tutorial you will be able to solve this challenge with ease.

## **Source**

[Reproduce a Docker Bridge Network Using Basic Linux Commands](https://labs.iximiuz.com/challenges/reproduce-docker-bridge-network)

## **[Back to Home](../../)**