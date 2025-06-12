# **Connect Two Network Namespaces**

Every container is placed in its own network namespace to give the containerized application the illusion of a private network environment. This trick is very handy for isolating applications from the host and from each other. However, such an isolation would be useless if it wasn't possible to communicate with the containerized apps.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/connect-two-network-namespaces/__static__/veth.png" width="400" alt="veth" > 
</p>

In this challenge, you'll need to connect the given network namespace with the host using a virtual Ethernet device.

> **Hint #1:**
> 
> Feel stuck? Try man ip-link. Look for the ip link add subcommand.

> **Hint #2:**
> 
> Make sure you named the ends of the virtual Ethernet device ``veth0`` and ``ceth0``. It's not like the names matter, but the solution checker expects them to be called that way.

Now, move the ``ceth0`` end of the virtual Ethernet device to the network namespace called ``container-1``.

> **Hint #3:**
>
> The ``ip link set`` command will help you to move the virtual Ethernet device to the network namespace. As always, ``man ip-link is`` your friend.

Finally, configure both ends of the virtual Ethernet device such that the host and the container can communicate with each other.

> **Hint #4:**
>
> It's actually simpler than it seems. You just need to assign IP addresses to both ends of the virtual Ethernet device. Preferably, the IP addresses should be from the same subnet.

> **Hint #5:**
>
> Oh, almost forgot! The devices should be turned on, of course.

## **Source**

[Connect Two Network Namespaces](https://labs.iximiuz.com/challenges/connect-two-network-namespaces)

## **[Back to Home](../../)**