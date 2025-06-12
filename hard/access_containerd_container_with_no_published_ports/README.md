# **Network Access to a Container Started by ctr**

In this challenge, you'll need to work with an Nginx container called ``networking-is-fun``. This container is started with ``ctr``, so to find it, you'll need to use the ``ctr container ls`` command. Inside of the container is the most standard Nginx server listening on ``0.0.0.0:80``. However, since the container is managed by a bare containerd daemon, its networking environment may be a bit different from what you're used to with Docker containers.

Your task is to send an HTTP request to this server.

There is no HTTP client in the container, and the playground will also try its best to prevent execution (i.e., ``ctr task exec``) of any commands in it, so you won't be able to install anything extra in the container either. Let's see how many ways you can find to access the Nginx server inside this container.

> **Hint #1:**
> 
> By default, every container in Docker gets its own virtual network environment. Typically, among other things, it includes two interfaces - the loopback and the primary interface with an IP address assigned to it. However, when started with ``ctr`` and no CNIs, the container's network environment will have only one interface - the loopback.

> **Hint #2:**
> 
> Since there is no veth pair connecting the container's network namespace to any other network namespace or a bridge, you won't be able to access the containerized Nginx server using an IP address other than ``127.0.0.1``. However, this is not the same ``127.0.0.1`` as on the host. It would to easy, right? 😉

> **Hint #3:**
>
> To access the container's ``loopback`` interface, you'll need to _enter_ its network namespace.

> **Hint #4:**
>
> Try ``nsenter --target <nginx's PID> --net`` command from the host. The ``lsns`` command is your friend. In particular, it's an easy way to find the PID of the ``networking-is-fun`` container.

## **Source**

[Network Access to a Container Started by ctr](https://labs.iximiuz.com/challenges/access-containerd-container-with-no-published-ports)

## **[Back to Home](../../)**