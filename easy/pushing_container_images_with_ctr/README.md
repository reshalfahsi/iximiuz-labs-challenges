# **Tag and Push Container Images Using ctr**

In this challenge, you'll need to push a local image to a remote registry ``registry.iximiuz.com``. The registry is accessible from the playground and it is protected by basic auth with the username ``iximiuzlabs`` and password ``rules!``. The image that you need to push is already available in the local containerd instance, so you only need to tag it properly and then push to the new location.

First, tag the image as ``registry.iximiuz.com/nginx:foo``.

> **Hint #1:**
>
> A single image can have an arbitrary number of names, aka tags, which can be assigned to it using the ``ctr image tag <existing-name> <new-name>`` command. The tag in this context means the full image name and not just the part after the colon.

> **Hint #2:**
>
> Not sure which image to tag? There should be only one image in the local containerd instance. You can find it using in the ``ctr image ls`` output.

Now, push the image to the ``registry.iximiuz.com/nginx`` repository.

> **Hint #3:**
>
> Surprisingly or not, it's only the (fully-qualified) image name, *aka* reference, that matters when pushing to a registry. If an image is named ``example.com:10000/foo/bar:qux``, it will be pushed to a registry running on ``example.com:10000``. Since our image is already properly named (*aka*, tagged), you can push it to the registry by simply running ``ctr image push``.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/pushing-container-images-with-ctr/__static__/container-image-name-format.png" width="400" alt="container-image-name-format" > 
</p>

> **Hint #4:**
>
> Getting the ``ctr: push access denied`` error? Make sure you're authenticated to the registry! There is no ``docker login`` equivalent in ``ctr``, but you can use the ``-u|--user <username>:<password>`` flag of the ``ctr image push`` command.

> **Hint #5:**
>
> If the ``ctr image push`` command fails with a cryptic ``ctr: content digest sha256:...: not found`` error, you're likely trying to push a multi-platform image for which you previously pulled only one platform. There are two ways to fix this: either re-pull the image for all platforms (using the boolean ``--all-platforms`` flag), or push only the platform you pulled (using the ``--platform amd64`` flag).

How about cleaning up after yourself? Remove all traces of the local image from the playground. Don't worry about the ``registry.iximiuz.com`` registry though - just remove the image from the local containerd instance.

> **Hint #6:**
>
> ``ctr image rm registry.iximiuz.com/nginx:foo`` didn't do the trick? This is because the image has one or more other names (*aka* tags). Any image can have multiple names simultaneously - make sure you removed all of them for this particular Nginx image.

## **Source**

[Tag and Push Container Images Using ctr](https://labs.iximiuz.com/challenges/pushing-container-images-with-ctr)

## **[Back to Home](../../)**