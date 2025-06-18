# **Build a Production-Ready Go Container Image: A Dynamically Linked Application**

You are tasked with optimizing the container image for a Go application. The application is a simple web service with a front page and a few API endpoints. The service uses an SQLite database to store the visitor counter, and since SQLite is a C library, the application is dynamically linked.

The source code of the application is located in the ``~/app`` directory, along with an initial Dockerfile. You can use the ``make docker-build`` command to build the image and ``make docker-run`` to run the container. However, the current setup does not adhere to containerization best practices. Your goal is to improve the Dockerfile and create a production-ready container image.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/dockerize-golang-application-dynamic-linking/__static__/container-image.png" width="400" alt="container-image" > 
</p>

Build a Docker image named ``registry.iximiuz.com/app:v1.0.0`` that meets the following requirements:

1. Base Image:
    - Use a minimalistic base image.
    - All application's dependencies must be satisfied.
2. Security:
    - The image must run as a non-root user.
    - Ensure there is no shell in the image.
3. Performance:
    - The final image size must not exceed ``40 MB``.
4. Runtime:
    - The application must:
        - Listen on ``0.0.0.0:3000``.
        - Include all HTML files from the ``templates`` folder.
        - Include all assets from the ``static`` folder.
        - Serve APIs and static files correctly.
5. Testing:
    - Verify the application by running a container and checking the main page and the API handlers responses.

The final solution will be validated using automated checks. You can access dynamic hints from the checks by clicking the task box below.

Good luck! 🚀

> **Hint #1:**
>
> If you're new to Docker, you may want to solve this simpler challenge first: [Build and Publish a Container Image With Docker](https://labs.iximiuz.com/challenges/build-and-publish-container-image-with-docker)

> **Hint #2:**
>
> The problem with the application's original Dockerfile is that it includes the dev- and build-time dependencies in the final image. It includes not only the Go compiler, but also hundreds of other packages and tools that are not needed at runtime but increase the image size and the attack surface:
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/dockerize-golang-application-dynamic-linking/__static__/single-stage-go.png" width="400" alt="single-stage-go" > </p>
>
> To separate the build- and runtime dependencies, a **multi-stage Docker build** can be used:
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/dockerize-golang-application-dynamic-linking/__static__/multi-stage-build.png" width="400" alt="multi-stage-build" > </p>
>
> If you're not familiar with this technique, check out this tutorial on [how to produce smaller container images with multi-stage builds](https://labs.iximiuz.com/tutorials/docker-multi-stage-builds).

> **Hint #3:**
>
> The Go application in this challenge is dynamically linked (i.e., depends on the system-wide ``libc``, the ``sqlite3`` C library, and potentially other external libraries), so choosing the right base image for the runtime stage is going to be trickier than [for a statically linked application](https://labs.iximiuz.com/challenges/dockerize-golang-application-static-linking).
>
> For instance, the (quite popular) ``FROM scratch`` approach won't work unless you're [willing to carefully craft a custom FROM scratch image](https://labs.iximiuz.com/tutorials/pitfalls-of-from-scratch-images) adding not only the necessary Linux rootfs layout and the certificate authority (CA) bundle, but also the required C libraries.
> 
> Switching to a minimalistic but full-fledged Linux distro like ``alpine`` won't do the trick either because of the requirement not to include a shell in the image.
> 
> [Distroless base images](https://labs.iximiuz.com/tutorials/gcr-distroless-container-images) to the rescue:
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/dockerize-golang-application-dynamic-linking/__static__/distroless-base-rev2.png" width="400" alt="distroless-base-rev2" > </p>
>
> But be careful: not all distroless images are suitable for a dynamically linked application.

## **Source**

[Build a Production-Ready Go Container Image: A Dynamically Linked Application](https://labs.iximiuz.com/challenges/dockerize-golang-application-dynamic-linking)

## **[Back to Home](../../)**