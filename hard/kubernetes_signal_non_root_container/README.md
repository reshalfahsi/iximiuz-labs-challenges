# **Send a Signal to a Kubernetes App: a Non-Root Container Case**

In this rather tricky challenge, you'll need to send a signal to an unprivileged container that uses a ``FROM scratch`` base image:

- Your cluster access is restricted to basic app management tasks.
- The app container runs in the Pod called ``non-root``.
- You're not allowed to modify or redeploy the Pod.
- The Pod's security context disallows containers running as ``root``.
- There is no shell in the target container.

Intriguing enough? Then give it a try!

> **Hint #1:**
>
> If you solved the [Send a Signal to a Kubernetes App: a Slim Container Case](https://labs.iximiuz.com/challenges/kubernetes-signal-slim-container) challenge, your first thought might be to use the ``kubectl debug`` command. This is definitely a good way to start, but don't be surprised if it doesn't work out of the box.
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/kubernetes-signal-non-root-container/__static__/ephemeral-containers-target-container-2000-opt.png" width="400" alt="ephemeral-containers-target-container-2000-opt" > </p>

> **Hint #2:**
>
> The ``kubectl debug`` command shouts **"container has runAsNonRoot and image will run as root"** and then hangs indefinitely? You may want to try a debugging image that doesn't run as ``root`` by default.

> **Hint #3:**
>
> Don't know where to find such an image? You can always build a debugging image of your own.
```bash
docker build -t registry.iximiuz.com/my-debugging-image:v1.0.0 -<<'EOD'
FROM alpine:3
USER 1002
EOD

docker push registry.iximiuz.com/my-debugging-image:v1.0.0
```

> **Hint #4:**
>
> Made the ``kubectl debug`` command work but now getting the **"can't kill pid 1: Operation not permitted"** error? Make sure the UID of the debugging container matches the UID of the target container. 😉

> **Hint #5:**
>
> Don't feel like building images? There is a more fine-grained way to start ephemeral containers than ``kubectl debug`` - ``PATCH``-ing the Pod's spec directly, which, in particular, allows you to specify the security context of the ephemeral container.
>
> Here is an example of how to start an ephemeral container called ``debug-123`` attached to the ``app`` container and running as a non-root user:
```bash
curl -Lvk localhost:8001/api/v1/namespaces/default/pods/non-root/ephemeralcontainers \
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
                "securityContext": {"runAsUser": 1000}
            }
        ]
    }
}'
```
> After you start such an ephemeral container, you'll still need to find a way to *execute* the ``kill`` command in it, but it shouldn't be too hard.

> **Hint #6:**
>
> As you saw in the previous hint, ephemeral containers are quite flexible. However, the ``kubectl debug`` command doesn't do a good job exposing the full power of the ephemeral containers API. If you don't feel like building custom debugging images or PATCH-ing the Pod's spec manually, you can try another debugging tool called [cdebug](https://github.com/iximiuz/cdebug), which also relies on the ephemeral containers API but hopefully provides a friendlier UX. Most of the playgrounds have it preinstalled: ``cdebug exec --help``.

## **Source**

[Send a Signal to a Kubernetes App: a Non-Root Container Case](https://labs.iximiuz.com/challenges/kubernetes-signal-non-root-container)

## **[Back to Home](../../)**