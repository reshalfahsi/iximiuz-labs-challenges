# **Kubernetes Pod With a Faulty Init Sequence**

There is a ``Pod`` called ``faulty`` in the ``challenge`` namespace. It's desperately trying to start up but can't get far enough in its lifecycle. Apparently, a new container was added to the Pod recently, and after that, the Pod stopped working. Can you identify what causes the Pod to fail and fix it? Note that you are not allowed to change the Pod images or their contents, but you can freely change the rest of the Pod spec.

Can you make all checks below pass?

> **Hint #1:**
>
> It's a good idea to start by reviewing the Pod spec. Take a close look at the ``.spec.containers`` and ``.spec.initContainers`` lists. Make sure you understand the ``.status.containerStatuses`` and ``.status.initContainerStatuses`` fields.
> 
> Check the Pod in the ``visual explorer``, or run the following command:

```bash
kubectl get pod faulty -n challenge -o yaml
```

> **Hint #2:**
>
> Try looking at the Pod's logs - they may shed some light on why some of the containers are failing:

```bash
kubectl logs -n challenge faulty -c CONTAINER_NAME
```

> **Hint #3:**
>
> While it's not always possible to sneak peek into the containerized application, in this case you can do that. All containers are simple Python scripts, and you can see their source code by running:

```bash
kubectl exec -n challenge faulty -c CONTAINER_NAME -- \
    cat /app/SCRIPT_NAME.py
```

> **Hint #4:**
>
> Remember that init containers are started before the regular containers. Does it look like the new init container may depend on a regular container? Should you try moving that regular container to the init list?

> **Hint #5:**
>
> Traditional init containers not just start in the order but also always run to completion. If the second init container expects the first one to be running, maybe it's time to try the new [restartPolicy: Always](https://labs.iximiuz.com/tutorials/kubernetes-native-sidecars) attribute? 😉

## **Source**

[Kubernetes Pod With a Faulty Init Sequence](https://labs.iximiuz.com/challenges/kubernetes-pod-with-faulty-init-sequence)

## **[Back to Home](../../)**