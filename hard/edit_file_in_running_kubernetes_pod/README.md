# **Edit a File in a Running Kubernetes Pod: a Tricky Case**

In this challenge, you'll need to modify a file in a container that runs in a Kubernetes Pod. The Pod is called ``web-server`` - you'll find it in the ``default`` namespace. Its single container is a simple application that serves static files from the ``/var/www/html`` directory.

You need to edit the ``index.html`` file of the above container:

- Replace the phrase "Hello World" with the phrase "Hello Labs".
- Add the phrase "Practice for the win!" to any place in the file.

Of course, you'll have to modify the file without making changes to the Pod's spec that can cause it to restart (other spec changes are allowed, though). Good luck!

> **Hint #1:**
>
> The good news is - there is a shell in the container. The bad news is - the container's user may not have the permissions to edit the file. But at least you can use ``kubectl exec`` to explore the inside of the container.

> **Hint #2:**
>
> The ``kubectl cp`` command will allow you to copy files from the Pod to your local machine, but due to the same permissions issue, you won't be able to copy the file back. Can you think of an alternative way to edit the file?

> **Hint #3:**
>
> With ``kubectl debug``, you can start a debugger sidecar container in the Pod, possibly as ``root``. If you get the flags right, you will even be able to enter the server process' PID namespace.
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/edit-file-in-running-kubernetes-pod/__static__/ephemeral-containers-default-2000-opt.png" width="400" alt="ephemeral-containers-default-2000-opt" > </p>
> However, there is a good chance that you'll not have access to the file system at ``/proc/server's PID/root``. Can you think of a reason why the ``root`` user may not be able to access some of the paths?

> **Hint #4:**
>
> The default *profile* of ``kubectl debug`` may not give the desired level of access, but the command's underlying mechanism - Ephemeral Containers - is the right way to go. Unfortunately, ``kubectl debug`` doesn't give you the fine-grained control over the security context of the ephemeral container it creates. But you can try your luck playing with the different ``--profile`` values.

> **Hint #5:**
>
> Did you know that it's possible to create an ephemeral container manually? It'd give you full control over its spec, so you could tweak the security context as needed.
```bash
kubectl proxy &

curl -Lvk localhost:8001/api/v1/namespaces/default/pods/web-server/ephemeralcontainers \
  -XPATCH \
  -H 'Content-Type: application/strategic-merge-patch+json' \
  -d '{
    "spec":
    {
        "ephemeralContainers":
        [
            {
                "name": "debug-123",
                "command": ["sh"],
                "targetContainerName": "app",
                "image": "alpine",
                "stdin": true,
                "tty": true,
                "securityContext": { ... }
            }
        ]
    }
}'
```
> After you start such an ephemeral container, you'll still need to find a way to **attach** to it, but it shouldn't be too hard.

> **Hint #6:**
>
> As you saw in the previous hint, ephemeral containers are quite flexible, but the ``kubectl debug`` command doesn't do a good job exposing all the knobs. If you don't feel like PATCH-ing the Pod's spec manually, you can try another debugging tool called [cdebug](https://github.com/iximiuz/cdebug), which also relies on the Ephemeral Containers API but hopefully provides a friendlier UX. Most of the playgrounds have it preinstalled: ``cdebug exec --help``.

## **Source**

[Edit a File in a Running Kubernetes Pod: a Tricky Case](https://labs.iximiuz.com/challenges/edit-file-in-running-kubernetes-pod)

## **[Back to Home](../../)**