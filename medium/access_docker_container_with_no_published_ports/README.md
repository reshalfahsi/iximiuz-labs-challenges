# **Access a Docker Container With No Published Ports**

In this challenge, you'll need to interact with a Docker container called ``networking-is-fun``. This container has an Nginx server listening on ``0.0.0.0:80``. Your task is to send an HTTP request to this server. The catch is that the container doesn't have any ports published, and there is no HTTP client installed inside the container. The playground will also try its best to prevent execution (i.e., ``docker exec``) of any commands in the container, so you won't be able to install anything extra into it either. But this shouldn't stop a real container ninja from accessing the Nginx, right? 😉

> **Hint #1:**
> 
> By default, every container in Docker gets its own virtual network environment confined to its own network namespace. Typically, (among other things) it includes two interfaces - the loopback and the primary interface. You can use any of these interfaces to access the Nginx server. The only problem is that you won't see these interfaces from the host's main network namespace.

> **Hint #2:**
> 
> You can *enter* the container's network namespace using the ``nsenter --target <nginx's PID> --net`` command on the host.

> **Hint #3:**
>
> The ``lsns`` command is your friend. In particular, it's an easy way to find the PID of the ``networking-is-fun`` container.

> **Hint #4:**
>
> If the namespace trickery sounds too daunting, you can try a more "traditional" way of accessing a containerized service. For instance, if you launch a client container in the same Docker network as the Nginx container, you'll be able to access Nginx using ``networking-is-fun`` as a regular DNS hostname. No port publishing is required for this to work.

> **Hint #5:**
>
> Ok, there might be an even easier way to access this Nginx server. By default, Docker containers are launched in the ``bridge`` network mode. In particular, it makes their IP addresses accessible from the host's main network namespace. You'll only need to find the IP address of the ``networking-is-fun`` container. Shouldn't be too hard when you can use ``docker inspect``.

## **Source**

[Access a Docker Container With No Published Ports](https://labs.iximiuz.com/challenges/access-docker-container-with-no-published-ports)

## **[Back to Home](../../)**