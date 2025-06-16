# **Send a Signal to a Kubernetes App: a Slim Container Case**

In this challenge, you'll need to signal a container running in the Pod called ``slim``. The target container has nothing but the app executable inside, so you won't be able to ``kubectl exec`` into it. Your cluster access is also limited - you can perform typical application management tasks in the ``default`` namespace, but the rest of the cluster (including SSH-ing into cluster nodes) is off limits. Ah, and of course, you're not allowed to modify or redeploy the Pod.

Good luck!

> **Hint #1:**
>
> Since there is no shell in the container, and SSH access to cluster nodes is disabled, your options are fairly limited. Which is great!

> **Hint #2:**
>
> Look at the challenge's tag list - it may give you some ideas.

> **Hint #3:**
>
> With the ``kubectl debug`` command, you can spawn ephemeral containers in already running Pods without causing any disruption. And you can use whatever images you want for them!
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/kubernetes-signal-slim-container/__static__/ephemeral-containers-default-2000-opt.png" width="400" alt="ephemeral-containers-default-2000-opt" > </p>

> **Hint #4:**
>
> Much like ``kubectl exec``, ``kubectl debug`` can also be used to execute commands in the target Pod, including starting interactive shells.

> **Hint #5:**
>
> Inside the right Pod but cannot see the application process? Make sure you're targeting the right container. 😉
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/kubernetes-signal-slim-container/__static__/ephemeral-containers-target-container-2000-opt.png" width="400" alt="ephemeral-containers-target-container-2000-opt" > </p>

## **Source**

[Send a Signal to a Kubernetes App: a Slim Container Case](https://labs.iximiuz.com/challenges/kubernetes-signal-slim-container)

## **[Back to Home](../../)**