# **Copy a Container Image from One Repository to Another with Docker**

Copying a container image from one repository to another is a common DevOps task. Sometimes, it's needed because the image is changing homes, other times, it's motivated by aggressive Docker Hub rate limiting, but often, it's simply a matter of "mirroring" public images using the company's internal registry.

In this challenge, you will need to copy a public ``ghcr.io/iximiuz/labs/nginx`` image from GHCR to the playground's private registry ``registry.iximiuz.com``. You need to copy only one tag - ``:alpine``. Store the copied image in the new ``registry.iximiuz.com/third-party/nginx`` repository.

Beware that ``registry.iximiuz.com`` is protected by basic auth with the username ``iximiuzlabs`` and password ``rules!``.

Good luck!

## **Hint**

### **Hint #1**

It's an easy one - try ``docker pull --help`` if you feel a bit lost.

### **Hint #2**

A single image can have an arbitrary number of names, aka tags, which can be assigned to it using the ``docker tag <existing-name> <new-name>`` command. The tag in this context means the full image name and not just the part after the colon.

### **Hint #3**

If the ``docker login`` command fails with:

```
Error response from daemon: Get "https://registry-1.docker.io/v2/":
unauthorized: incorrect username or password
```

...make sure you are logging in to the right registry. If no registry is specified in the command, Docker will default to ``docker.io``, which is Docker Hub. In this challenge, you are expected to push the image to another registry - ``registry.iximiuz.com``.

### **Hint #4:**

Surprisingly or not, it's only the (fully-qualified) image name, *aka* reference, that matters when pushing to a registry. If an image is named ``example.com:10000/foo/bar:qux``, it will be pushed to a registry running on ``example.com:10000`` when the ``docker push`` command is performed.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/copy-container-image-from-one-repository-to-another-with-docker/__static__/container-image-name-format.png" width="400" alt="container-image-name-format" > 
</p>

## **Source**

[Copy a Container Image from One Repository to Another with Docker](https://labs.iximiuz.com/challenges/copy-container-image-from-one-repository-to-another-with-docker)

## **[Back to Home](../../)**