# **Extract the Filesystem of a Container Image**

Internally, container images have a layered structure, with each layer representing a filesystem diff produced by a corresponding ``RUN``, ``COPY``, or ``ADD`` instruction in its Dockerfile. However, when a container is created from an image, its filesystem appears as a standard Linux directory structure. Usually, it's a responsibility of the runtime to mount the image layers as a container filesystem, but sometimes, a need to manually extract the packaged filesystem into a local folder may arise. In particular, this may be useful for debugging purposes.

<p align="center">
    <img src="https://labs.iximiuz.com/content/files/challenges/extract-container-image-filesystem/__static__/image-to-filesystem-min.png" width="400" alt="image-to-filesystem-min" >
</p>

In this challenge, you will need to unpack the filesystem of a container image into a local directory. The image is already pulled for you - you can find it in the output of the ``docker images`` command. Store its filesystem in the ``~/imagefs`` directory. Make sure you export the filesystem of this exact image variant (platform ``linux/mips64le``), because it may differ from the filesystem of the same image on other platforms.

> **Hint #1:**
>
> Don't use the ``docker save`` command - it dumps the "raw" layered structure of the image, while you need to extract the "baked" filesystem of the image.

> **Hint #2:**
>
> The ``crane export`` command surprisingly produces incomplete results. Compare the ``/root`` directory in the actual image filesystem at [ima.ge.cx/ghcr.io/iximiuz/labs/redis:latest](https://ima.ge.cx/ghcr.io/iximiuz/labs/redis:latest) and the ``~/imagefs`` directory produced by ``crane export``. You may be surprised to see that the local ``~/imagefs`` directory is missing some files.

> **Hint #3:**
>
> Feeling a bit lost? Check out this short tutorial - [How To Extract Container Image Filesystem Using Docker](https://labs.iximiuz.com/tutorials/extracting-container-image-filesystem).

## **Source**

[Extract the Filesystem of a Container Image](https://labs.iximiuz.com/challenges/extract-container-image-filesystem)

## **[Back to Home](../../)**