# **What Port Does This Kubernetes Pod Listen On?**

There's a Pod called ``lonely`` running in the ``default`` namespace, acting as a simple HTTP server. Oddly enough, it chooses a random port to listen on each time it starts. Your job is to figure out which port this server is using and then send an HTTP request to it. To add to the challenge, there's no shell available in the container, and your access to the cluster is quite limited.

Good luck!

> **Hint #1:**
>
> [Listing open ports is a pretty typical Linux administration task](https://labs.iximiuz.com/challenges/linux-find-port-used-by-service), and there are well-known tools to help you with that. With shell access to the server's container, it shouldn't be too hard to find out which port the server process listens on. Unfortunately, in this challenge, there is no shell in the target container, and you cannot SSH into the cluster nodes either. Can you think of a way to execute a command in a shell-less Kubernetes Pod?

> **Hint #2:**
>
> If don't know how to execute commands in a Kubernetes Pod that doesn't have a shell, you may want to solve [this challenge](https://labs.iximiuz.com/challenges/kubernetes-signal-slim-container) first.

> **Hint #3:**
>
> Pod's IP address may not be directly accessible from outside the cluster. So you'll need to either find a way to access the port while being in the cluster, or *forward* a local port to the Pod using the ``kubectl port-forward`` command.

## **Source**

[What Port Does This Kubernetes Pod Listen On?](https://labs.iximiuz.com/challenges/kubernetes-what-port-this-pod-listens-on)

## **[Back to Home](../../)**