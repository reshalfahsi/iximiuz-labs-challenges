# **Send a Signal to a Kubernetes App: a Simple Case**

In this challenge, you'll need to send a signal to a container running in the Pod called ``simple``. Your cluster access is limited, but you can perform typical application management tasks in the ``default`` namespace. Please, do not modify or redeploy the Pod.

Good luck!

> **Hint #1:**
>
> At the time this challenge was created, there was no ``docker kill`` analog in ``kubectl``. But luckily, ``docker kill`` is not the only way to signal a containerized application. Can you think of a more "traditional" way to send a signal to a Linux process?

> **Hint #2:**
>
> If you could only start a shell inside the target container...

> **Hint #3:**
>
> Wait, there must be a way to *execute* commands in Pod's containers.

> **Hint #4:**
>
> Have you tried ``kubectl exec`` yet?

## **Source**

[Send a Signal to a Kubernetes App: a Simple Case](https://labs.iximiuz.com/challenges/kubernetes-signal-container)

## **[Back to Home](../../)**