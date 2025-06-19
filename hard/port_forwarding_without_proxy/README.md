# **Forward a Port Without Starting a Proxy Process**

In this challenge, you'll need to reproduce a trick that Docker uses to *publish* a service running inside a container to one of the host's ports. However, to make the technique more obvious, no containers will be used - only plain Linux processes.

There is an HTTP service listening on port ``5000`` of a dummy ``192.168.0.2`` interface. Your task is to make this service available on ``0.0.0.0:6000`` of the host. You need to accomplish it without changing the service configuration or restarting it, and you're also not allowed to launch any additional processes that would be listening on host's ``6000`` port.

> **Hint #1:**
> 
> **Port forwarding** *a.k.a.* **port mapping** or, in Docker's parlance, **port publishing** is a form of Network Address Translation (NAT) that redirects packets from one address to another. As is often the case, there are multiple ways to accomplish it, so the fact that you're not allowed to launch any additional listening processes doesn't mean you're out of options.
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/port-forwarding-without-proxy/__static__/port-forwarding.png" width="400" alt="port-forwarding" > </p>

> **Hint #2:**
> 
> The clue is hidden in the challenge's tags. 😉

> **Hint #3:**
>
> One of the ``iptables`` tables is called ``nat`` (Network Address Translation). Port forwarding is a form of NAT, so now you know which table to use.

> **Hint #4:**
>
> Unfortunately, the most obvious ``iptables -t nat -A PREROUTING -p tcp --dport 6000 -j REDIRECT --to-port 5000`` rule won't work. With the ``REDIRECT`` target, you're only allowed to change the destination port. It would be sufficient if the service was listening on ``0.0.0.0:5000``, but in this challenge, it's bound to a specific IP address.

> **Hint #5:**
>
> Since it's the destination address that needs to be changed, the target you're looking for is ``DNAT`` (Destination NAT).

> **Hint #6:**
>
> Are you trying to list all host's interfaces using several ``iptables`` rules with different ``-d`` flags? It's not what the challenge asks for 😉
>
> To solve the challenge, you need to add a generic redirect rule for ``0.0.0.0:6000``. The solution checker periodically adds a temporary interface with a random IP address and then tries to reach the service on the port ``6000`` of this new address. Luckily, the solution might be simpler than you think - try removing the ``-d`` flag from your rules, did it help?

> **Hint #7:**
>
> First checks pass, but the last one fails (or vice versa)? There is a subtle difference between the traffic that originates from the host itself and the one that comes from the outside. [Local and external traffic follow different paths in the network stack](https://iximiuz.com/en/posts/laymans-iptables-101/). You'll need to use the ``OUTPUT`` chain for the former and ``PREROUTING`` for the latter.
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/port-forwarding-without-proxy/__static__/iptables-chains.png" width="400" alt="iptables-chains" > </p>

## **Source**

[Forward a Port Without Starting a Proxy Process](https://labs.iximiuz.com/challenges/port-forwarding-without-proxy)

## **[Back to Home](../../)**