# **Build and Publish a Container Image With Docker**

In this challenge, you will practice one of the most basic Docker operations: building and publishing a container image.

You can find the application you need to package at ``~/projects/foobar``. It already comes with a Dockerfile, so you won't have to write one from scratch. Using this Dockerfile, build a container image and publish it to the remote repository ``registry.iximiuz.com/foobar`` under the tag ``v1.0.0``.

Beware that ``registry.iximiuz.com`` requires authentication. Use the username ``iximiuzlabs`` with the password ``rules!`` to log in before pushing the image.

## **Hint**

### **Hint #1**

It's an easy one - try ``docker pull --help`` if you feel a bit lost.

### **Hint #2**

Another easy one - ``docker login --help`` is your friend.

### **Hint #3**

If the ``docker login`` command fails with:

```
Error response from daemon: Get "https://registry-1.docker.io/v2/":
unauthorized: incorrect username or password
```

...make sure you are logging in to the right registry. If no registry is specified in the command, Docker will default to ``docker.io``, which is Docker Hub. In this challenge, you are expected to push the image to another registry - ``registry.iximiuz.com``.

### **Hint #4:**

Surprisingly or not, it's only the (fully-qualified) image name, *aka* reference, that matters when pushing to a registry. If an image is named ``example.com:10000/foo/bar:qux``, it will be pushed to a registry running on ``example.com:10000``.

Make sure the image you built is tagged properly - the fully-qualified image name must include the registry (*hostname*), the repository (*path*), and the tag (*part after the colon*).

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/build-and-publish-container-image-with-docker/__static__/container-image-name-format.png" width="400" alt="container-image-name-format" > 
</p>

## **Source**

[Build and Publish a Container Image With Docker](https://labs.iximiuz.com/challenges/build-and-publish-container-image-with-docker)

## **[Back to Home](../../)**