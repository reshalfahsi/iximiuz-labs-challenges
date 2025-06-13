# **Start and Inspect a Container With Podman**

In this challenge, you will need to start a container using an alternative container runtime called *Podman*.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/start-container-with-podman/__static__/different-ways-to-start-containers.png" width="400" alt="different-ways-to-start-containers" > 
</p>

You can use any container image you like, but we recommend choosing a long-running container (e.g., ``nginx``) because to complete this challenge you will also need to inspect the running container and answer a few questions about it.

> **Hint #1:**
>
> **Podman** tries to be as compatible with the Docker CLI as possible. If you're familiar with Docker, you already know how to start a container with Podman. And if you're not, try solving this [Docker 101 challenge](https://labs.iximiuz.com/challenges/start-container-with-docker) first.

To keep track of containers, Podman assigns a unique ID to each of them. Can you find the ID of the container that you've just started?

> **Hint #2:**
>
> It's an easy one - ``podman --help`` will show you the way.

Now, when you have a running container, let's try to understand what it actually is.

Did you know that [Linux containers are regular processes](https://iximiuz.com/en/posts/oci-containers/)? Can you locate the main container's process? What is its PID?

> **Hint #3:**
>
> If containers are *regular Linux processes*, will they show up in ``ps`` or ``top`` output? 🤔

> **Hint #4:**
>
> Entered a PID of a process that definitely belongs to the container, but the solution checker doesn't accept it? One of the key Docker design principles which Podman (although reluctantly) follows too is to run **one service per container**. However, it doesn't mean that every container will have only one process inside. Actually, more often than not, you'll find a whole process tree inside a container. Try identifying the root process of that tree. That's what the checker expects.

> **Hint #5:**
>
> Still having trouble? You can always fall back to ``podman inspect`` to cross-check your findings.

Approximating containers to *regular Linux processes* is helpful, but it's not very accurate. Thinking of containers as of *boxes for processes* might be even more helpful at times.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/start-container-with-podman/__static__/container-box.png" width="400" alt="container-box" > 
</p>

From inside the box, it may look like the containerized app is running on its own machine. In particular, such a virtualized environment will have its own network interface and an IP address. Can you find the IP address of the container that you've just started?

> **Hint #6:**
>
> There are many ways to find the container IP address. If you're a Linux guru, you can try your luck with ``ip netns`` and ``ip addr``.

> **Hint #7:**
>
> Don't feel comfortable messing with Linux network namespaces? You can always use the ``podman inspect`` command to find the container IP address.

## **Source**

[Start and Inspect a Container With Podman](https://labs.iximiuz.com/challenges/start-container-with-podman)

## **[Back to Home](../../)**