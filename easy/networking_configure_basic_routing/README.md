# **Linux Networking: Route Traffic Between Two Private Networks**

You have a network topology with three separate machines on two different networks:

- **leaf-01** connected to network **net-1** (``192.168.178.10/24``)
- **leaf-02** connected to network **net-2** (``10.0.0.20/16``)
- **router** acting as a gateway between networks **net-1** and **net-2** (``192.168.178.2/24`` and ``10.0.0.2/16`` respectively)

The network topology looks as follows:

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/networking-configure-basic-routing/__static__/networking-basic-routing-problem.png" width="400" alt="networking-basic-routing-problem" > 
</p>

Currently, the two leaf nodes cannot reach each other because they are on different networks and don't know how to route traffic between them. You need to solve this fundamental networking problem.

**Your mission**: Configure basic routing so that **leaf-01** and **leaf-02** can communicate with each other through the **router**.

Configure the routing on ``leaf-01``.

> **Hint #1:**
>
> The leaf-01 machine needs to know where to send traffic destined for networks it's not directly connected to. Look into configuring a **default route** that points to the router.
> 
> The ``ip route`` command is your friend here. Check ``man ip-route`` for syntax details.

> **Hint #2:**
>
> Alternatively, you can use the ``ip route add`` command to add a specific route for packets destined for the **net-2** network. This is an equally valid solution.

Configure the routing on ``leaf-02``.

> **Hint #3:**
>
> Similar to leaf-01, the leaf-02 machine also needs to know how to reach networks it's not directly connected to. The same concept applies, but pay attention to which gateway IP address to use for this network.

Configure the ``router`` to forward packets.

> **Hint #4:**
>
> By default, Linux systems don't forward packets between network interfaces of the same machine. The router needs to be explicitly configured to forward packets from one network to another.
>
> Look into the ``net.ipv4.ip_forward`` kernel parameter. You can control it via ``/proc/sys/`` or using the ``sysctl`` command.

Test connectivity from **leaf-01** to **leaf-02**.

Test connectivity from **leaf-02** to **leaf-01**.

> **Understanding Routing**
>
> Computers can only directly talk to other computers on the same subnet ([via the bridge or switch that connects them](https://labs.iximiuz.com/courses/computer-networking-fundamentals/from-lan-to-vxlan#L2-segment)).
>
> Routing is about telling machines where to send packets they can't deliver directly. When a machine doesn't know how to reach a destination, it:
> 
> 1. Checks its routing table for specific routes
> 2. If no specific route exists, uses the default route (if configured)
> 3. The default route typically points to a gateway node that is connected to the machine's subnet and one or more other subnets and can forward packets between them
> 
> Think about what each machine needs to know to reach the other networks in the given topology.
> <p align="center"><img src="https://labs.iximiuz.com/content/files/challenges/networking-configure-basic-routing/__static__/networking-basic-routing-solution.png" width="400" alt="networking-basic-routing-solution" ></p>

> **Troubleshooting**
>
> If connectivity isn't working, verify:
> 1. Each leaf node knows how to reach networks it's not directly connected to
> 2. The router is configured to forward packets between interfaces
> 3. You're working on the correct machine (check with ``hostname``)
> 
> Useful commands for debugging:
> - ``ip route show`` - displays the routing table
> - ``ip addr show`` - shows interface configuration
> - ``ping <ip>`` - tests network connectivity
> - ``traceroute <ip>`` - shows the path packets take

## **Source**

[Linux Networking: Route Traffic Between Two Private Networks](https://labs.iximiuz.com/challenges/networking-configure-basic-routing)

## **[Back to Home](../../)**