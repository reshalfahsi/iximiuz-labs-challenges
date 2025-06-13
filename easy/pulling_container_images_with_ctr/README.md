# **Pull Container Images Using ctr**

In this containerd challenge, you'll need to pull images from different container registries using the ``ctr`` command.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/pulling-container-images-with-ctr/__static__/container-image-name-format.png" width="400" alt="container-image-name-format" > 
</p>

Let's start with a simple one - pull an ``nginx`` image from Docker Hub.

> **Hint #1:**
>
> Unlike with the ``docker`` command, you can't just run ``ctr pull nginx``. The ``ctr`` command has a subcommand for working with images. Try ``ctr image --help`` to see how to use it.

> **Hint #2:**
>
> The ``ctr image pull`` command takes a fully-qualified image reference as an argument. The famous ``docker run nginx`` is actually a shorthand for ``docker run docker.io/library/nginx:latest``. Try adapting this sacred knowledge to ctr image pull.

Docker Hub is not the only container registry supported by containerd. Let's try pulling an image from another source - Google Container Registry (GCR) - ``gcr.io/distroless/static-debian12`` is a good candidate.

> **Hint #3:**
>
> Getting a cryptic ``failed to resolve reference: object required`` error? Make sure you're using the fully-qualified image reference, including the tag!

To solidify your knowledge, let's try pulling an image from one more registry - the GitHub Container Registry (GHCR). This time, you'll need to come up with the image example yourself.

> **Hint #4:**
>
> A fully-qualified image reference consists of three parts: the registry domain, the repository path, and the tag. For example, in ``gcr.io/distroless/static-debian12:nonroot``, the domain is ``gcr.io``, the repository path is ``distroless/static-debian12``, and the tag is ``nonroot``.

> **Hint #5:**
>
> The GitHub Container Registry domain is ``ghcr.io``.

> **Hint #6:**
>
> On GHCR, the image repository path is typically the same as the code repository path. For example, images of the ``github.com/openfaas/faas-netes`` project are hosted at ``ghcr.io/openfaas/faas-netes``.

## **Source**

[Pull Container Images Using ctr](https://labs.iximiuz.com/challenges/pulling-container-images-with-ctr)

## **[Back to Home](../../)**