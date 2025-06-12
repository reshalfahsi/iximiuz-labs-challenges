# **Docker 101: Override Default Container Commands and Arguments**

In this challenge, you'll practice running arbitrary commands using off-the-shelf container images.

When invoked without any arguments, the ``docker run redis`` command will start a ``redis`` server in a container. However, the ``redis`` image also includes the ``redis-cli`` executable, which can be used to interact with any Redis server instance (not necessarily the one running in the same container). This makes a ``redis`` container a handy way to run ``redis-cli`` without installing it on your machine. But only if you know how to override its default command 😉

Run ``redis-cli`` with the ``--version`` flag in a ``redis`` container.

## **Hint**

Docker designed containers in such a way that they can be run without any additional arguments by default. For instance, ``docker run redis`` will start a ``redis`` process in a container, because the ``redis`` image has a default ``redis-server`` command [defined in its Dockerfile](https://github.com/redis/docker-library-redis/blob/8338d86bc3f7b195046138f8c31bf9a839cdedd3/7.4/debian/Dockerfile#L150):

```Dockerfile
FROM ...some base image...
RUN ..install redis...

# Run the redis-server command by default
CMD ["redis-server"]
```

However, oftentimes container images include more than one executable file, and you may want to run a container using other than the default command and/or pass some arguments to it.

Luckily, the ``docker run`` command is flexible enough to support this:

```bash
docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
```

## **Source**

[Docker 101: Override Default Container Commands and Arguments](https://labs.iximiuz.com/challenges/docker-101-container-run-override-command)

## **[Back to Home](../../)**