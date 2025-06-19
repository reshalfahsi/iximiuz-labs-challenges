# **Kubernetes Pod With a Sleepy Init Sequence**

There is ``a Pod`` called ``sleepy`` in the ``challenge`` namespace. Much like its [faulty sibling](https://labs.iximiuz.com/challenges/kubernetes-pod-with-faulty-init-sequence), it experiences some trouble starting up. Can you figure out what's wrong with ``sleepy`` and help it achieve the Ready condition without changing the Pod images or their contents?

> **Hint #1:**
>
> As usual, it's a good idea to start by reviewing the Pod spec and the container logs. Take a close look at the ``.spec.containers`` and ``.spec.initContainers`` lists. Make sure you understand the ``.status.containerStatuses`` and ``.status.initContainerStatuses`` fields. Examine the logs of the ``sleepy-sidecar`` and ``app`` containers.

> **Hint #2:**
>
> The ``sleepy-sidecar`` container is supposed not to just start before the ``app`` container but also to be fully functional.

> **Hint #3:**
>
> Kubernetes "native" sidecar containers [have introduced](https://labs.iximiuz.com/tutorials/kubernetes-native-sidecars) a new container-level ``restartPolicy`` attribute. What other new attributes do they bring?

> **Hint #4:**
>
> Sometimes, an ``exec`` probe with ``curl`` (or any other HTTP client) can be used instead of an ``httpGet`` probe to check the container's readiness endpoint. And for containers listening on ``localhost``, it might be the only option.

## **Source**

[Kubernetes Pod With a Sleepy Init Sequence](https://labs.iximiuz.com/challenges/kubernetes-pod-with-sleepy-init-sequence)

## **[Back to Home](../../)**