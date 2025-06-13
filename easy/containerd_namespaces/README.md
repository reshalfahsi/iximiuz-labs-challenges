# **Working With containerd Namespaces**

Docker uses Linux namespaces (among other things) to isolate containers from each other. Kubernetes uses (although "slightly" different) namespaces for cluster resource isolation. And containerd is no exception - it has its own notion of namespaces.

Let's try working with containerd namespaces using the ``ctr`` command-line client.

First, you'll need to create a new containerd namespace called ``my-ns``. It's an easy ask, so no hints, sorry. Try ``ctr namespace --help`` if you feel stuck.

Now run a container in the newly created namespace. It's a good idea to pick a relatively long-lived container (like ``nginx:alpine``), so that the solution checker has enough time to notice it.

> **Hint #1:**
>
> Both ``ctr run --help`` and ``ctr container create --help`` were of no help? Try ``ctr --help | grep -C 1 namespace``.

> **Hint #2:**
>
> The ``--namespace`` flag is a so-called global flag - it should be specified before the subcommand. Example: ``ctr --namespace my-ns container ls``.

> **Hint #3:**
>
> Getting an ``image not found`` error? Don't forget to ``ctr image pull`` first. Unlike ``docker run``, ``ctr run`` doesn't pull images automatically.

> **Hint #4:**
>
> Still getting that ``image not found`` error? Make sure you're pulling the image to the right namespace. Images, containers, and tasks are all namespaced in containerd.

If containerd is the "backend" of Docker, then it must know about the containers that Docker runs, right?

There is a Docker container called ``labs-are-fun`` running in the playground right now. You should be able to see it in the ``docker ps`` output. Can you find this container in containerd using the ``ctr`` command? What's its task ID?

Write the task ID of the ``labs-are-fun`` container to the ``/tmp/labs-are-fun.txt`` file.

> **Hint #5:**
>
> Try ``ctr container ls`` and ``ctr task ls`` commands.

> **Hint #6:**
>
> Apply the knowledge about namespaces you've gained in the preceding exercises.

> **Hint #7:**
>
> What's the name of the Docker's open-source alter ego? It's also a name of a famous whale.

> **Hint #8:**
>
> Tasks are also namespaced in containerd.

## **Source**

[Working With containerd Namespaces](https://labs.iximiuz.com/challenges/containerd-namespaces)

## **[Back to Home](../../)**