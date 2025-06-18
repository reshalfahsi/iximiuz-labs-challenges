# **Docker 101: Run a Container in Background, Read Logs, and Attach**

When you run a container using the ``docker run <image>`` command without any additional flags, the container starts in the foreground - the command blocks the terminal session and the container's stdout and stderr streams starts being written to the console.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/docker-101-container-run-in-background/__static__/docker-run.png" width="400" alt="docker-run" > 
</p>

While handy for some use cases (e.g., running a CLI tool in a container, quickly testing a container image, etc.), often you'd want to run the container in the background - i.e., without attaching the current shell to its stdio streams. This way you can continue using the terminal session after the container starts, and the container itself will keep running even after the terminal window is closed.

**In this challenge, you'll practice**:

- Running a container in the background
- Accessing the container's logs
- Re-attaching to a background container

First, start an ``nginx`` container in the background.

> **Hint #1:**
>
> This is an easy one - try ``docker run --help`` and look for a relevant flag.

Once the background Nginx container has started, it will receive and log a request. Can you retrieve the ``nounce`` GET parameter from its access log?

> **Hint #2:**
>
> Regardless of whether a container is started in the foreground or background, its stdout and stderr output is recorded as container logs. Since the containerized Nginx dumps its access logs to stderr, you can browse it using the following command:
```bash
docker logs NGINX_CONTAINER
```
> ...where ``NGINX_CONTAINER`` is either ID or name of the Nginx container you started in the previous task.

> **Hint #3:**
>
> If you haven't noted the container ID dumped by the ``docker run -d`` command, you can still retrieve it by listing all running containers on your system using the following command:
```bash
docker ps
```

A less frequently used but still sometimes needed operation is to re-attach to a container running in the background. Attach the current shell to the Nginx container using the ``docker attach`` command.

> **Hint #4:**
>
> To re-attach to a background container, use the following command:
```bash
docker attach NGINX_CONTAINER

```
> ...where ``NGINX_CONTAINER`` is either ID or name of the Nginx container you started in the previous task.

Once you've re-attached to the Nginx container, you should see its access logs being written to the console. However, unlike ``docker logs``, ``docker attach`` shows only the stdout/stderr output from the moment you've attached to the container.

Note that ``docker attach`` also makes signals forwarded to the container, so you can kill it using ``^C`` (which may often happen accidentally until you get used to the ``docker attach`` behavior).

Press ``^C`` to terminate the container.

## **Source**

[Docker 101: Run a Container in Background, Read Logs, and Attach](https://labs.iximiuz.com/challenges/docker-101-container-run-in-background)

## **[Back to Home](../../)**