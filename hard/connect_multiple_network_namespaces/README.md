# **Connect Multiple Network Namespaces**

This is a more advanced continuation of the [Connect Two Network Namespaces](https://labs.iximiuz.com/challenges/connect-two-network-namespaces) problem.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/connect-multiple-network-namespaces/__static__/route-clash.png" width="400" alt="route-clash" > 
</p>

Your task is to create two network namespaces, ``netns0`` and ``netns1``, add a virtual Ethernet device to each of them, and configure the devices such that the host and the containers can communicate with each other.

> **Hint #1:**
> 
> Not sure how to create a network namespace? Check out the [Create a Network Namespace](https://labs.iximiuz.com/challenges/linux-network-namespace) challenge.

Now, you need to create two virtual Ethernet pairs, i.e. four virtual Ethernet devices.

> **Hint #2:**
> 
> This part is fully covered in the [Connect Two Network Namespaces](https://labs.iximiuz.com/challenges/connect-two-network-namespaces) challenge. You may want to solve that one first.

Finally, provision the network namespaces with IP addresses and configure the routing to allow the host and the containers to intercommunicate. At any given moment:

- The host should be able to ping ``netns0``.
- The host should be able to ping ``netns1``.
- ``netns0`` should be able to ping the host.
- ``netns1`` should be able to ping the host.
- ``netns0`` should be able to ping ``netns1``.
- ``netns1`` should be able to ping ``netns0``.

> **Hint #3:**
>
> It might be that an extra network device is needed to make the setup work. The clue is in the tag list of this challenge 😉

> **Hint #4:**
>
> Most of the routing rules will be added automagically as soon as that missing network device is created, and the IP addresses are assigned for every participating network device. But there is one rule that you will need to add manually for both ``netns0`` and ``netns1`` - the default route.

> **Hint #5:**
>
> Too hard? No worries! The [How Container Networking Works: a Docker Bridge Network From Scratch](https://labs.iximiuz.com/tutorials/container-networking-from-scratch) tutorial has a step-by-step guide on how to solve this challenge.

## **Source**

[Connect Multiple Network Namespaces](https://labs.iximiuz.com/challenges/connect-multiple-network-namespaces)

## **[Back to Home](../../)**