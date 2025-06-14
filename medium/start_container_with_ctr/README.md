# **Start and Inspect a Container With containerd CLI - ctr**

In this challenge, you will need to start a container using the default containerd CLI - ``ctr``. [Knowing how to use it](https://labs.iximiuz.com/courses/containerd-cli/ctr/container-management) may come in handy when you need to debug lower-level container issues (e.g., troubleshoot Kubernetes CRI on a containerd-powered cluster node).

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/start-container-with-ctr/__static__/different-ways-to-start-containers.png" width="400" alt="different-ways-to-start-containers" > 
</p>

You can use any container image you like, but we recommend choosing a long-running container (e.g., ``nginx``) because to complete this challenge you will also need to inspect the running container and answer a few questions about it.

> **Hint #1:**
>
> **ctr** is similar (although more low-level) to the **docker** CLI. If you're familiar with Docker, following the ``ctr --help`` and ``ctr run`` error messages should be enough to complete this challenge. And if you're not, try solving this [Docker 101 challenge](https://labs.iximiuz.com/challenges/start-container-with-docker) first.

> **Hint #2:**
>
> Unlike Docker, ``ctr`` requires you to pull the image explicitly before running it. See ``ctr image pull --help`` for more.

> **Hint #3:**
>
> Getting the mysterious ``ctr: failed to resolve reference "<IMAGE>": object required`` error? Make sure you specify the image name fully! No, ``nginx`` and even ``nginx:latest`` aren't good enough. The fully qualified Nginx image name is actually ``docker.io/library/nginx:latest``.

> **Hint #4:**
>
> Much like with explicit image pulling, ``ctr`` requires you to explicitly specify the container ID before running it. If you see the ``ctr: container id must be provided`` error, try adding one more argument to the ``ctr run`` command.

Now, when you have a running container, let's try to understand what it actually is.

Did you know that [containers are regular Linux processes](https://iximiuz.com/en/posts/oci-containers/)? Can you locate the main container's process? What is its PID?

> **Hint #5:**
>
> If containers are regular Linux processes, will they show up in ``ps`` or ``top`` output? 🤔

> **Hint #6:**
>
> Entered a PID of a process that definitely belongs to the container, but the solution checker doesn't accept it? One of the key Docker (hence, containerd) design principles is to run **one service per container**. However, it doesn't mean that every container will have only one process inside. Actually, more often than not, you'll find a whole process tree inside a container. Try identifying the root process of that tree. That's what the checker expects.

Approximating containers to *regular Linux processes* is helpful, but it's not very accurate. Thinking of containers as of *boxes for processes* might be even more helpful at times.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/start-container-with-ctr/__static__/container-box.png" width="400" alt="container-box" > 
</p>

From inside the box, it may look like the containerized app is running on its own machine. In particular, such a virtualized environment will have its own set of network devices. This network virtualization is done using Linux network namespaces. Can you find the ID (*inode number*) of the network namespace the just started container is running in?

> **Hint #7:**
>
> ``lsns`` is a very handy command for listing all network namespaces in the system. Spotting the container ``netns`` in the ``lsns`` output shouldn't be too hard.

Now that you know the container ``netns`` ID, can you find the container IP address?

> **Hint #8:**
>
> There might be no easy way to get this info with ``ctr``. But since you know the container ``netns`` already, you can *[enter](https://man7.org/linux/man-pages/man1/nsenter.1.html)* it and run any command you like. Including ``ip addr show``.

> **Hint #9:**
>
> Don't be surprised if you see nothing but the ``lo`` interface. The bare minimum configuration that ``containerd`` performs when starting a container is creating a new network namespace. Adding network interfaces and configuring them is usually delegated to various CNI plugins or a higher-level container runtime (e.g., Docker).

## **Source**

[Start and Inspect a Container With containerd CLI - ctr](https://labs.iximiuz.com/challenges/start-container-with-ctr)

## **[Back to Home](../../)**