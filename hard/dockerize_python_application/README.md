# **Build a Production-Ready Python Container Image: FastAPI Application**

You are tasked with optimizing the container image for a FastAPI application. The application is a simple web service with a front page and a few API endpoints. The source code of the application is located in the ``~/app`` directory, along with an initial Dockerfile.

You can use the ``make docker-build`` command to build the image and ``make docker-run`` to run the container. However, the current setup does not adhere to containerization best practices. Your goal is to improve the Dockerfile and create a production-ready container image.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/dockerize-python-application/__static__/container-image.png" width="400" alt="container-image" >
</p>

Build a Docker image named ``registry.iximiuz.com/app:v1.0.0`` that meets the following requirements:

1. Base Image:
    - Use an optimal Python base image.
2. Security:
    - The image must run as a non-root user.
    - Include only necessary packages and files.
3. Performance:
    - The final image size must not exceed ``200 MB``.
4. Runtime:
    - The container should not depend on ``poetry``, ``uv``, or the like package managers at runtime.
    - The application must:
        - Listen on ``0.0.0.0:3000``.
        - Include all assets from the ``app/static`` folder.
        - Serve APIs and static files correctly.
        - Serve the ``/image`` endpoint correctly.
5. Testing:
    - Verify the application by running a container and checking the main page and the API handlers responses.

The final solution will be validated using automated checks. You can access dynamic hints from the checks by clicking the task box below.

Good luck! 🚀

> **Hint:**
>
> The production Python application image must not include pytest or any other development dependencies. Pro Tip: Split the dependencies in the pyproject.toml file into two groups: main and dev.

> **Hint #1:**
>
> If you're new to Docker, you may want to solve this simpler challenge first: [Build and Publish a Container Image With Docker](https://labs.iximiuz.com/challenges/build-and-publish-container-image-with-docker)

> **Hint #2:**
>
> Python applications may depend on PyPI packages with modules written in C, C++, Rust, or other compiled languages. Some of these packages provide pre-compiled wheels for the most popular build targets, but not all of them. Thus, for ``pip install`` to succeed, you may need to have a full-blown compiler toolchain (or multiple toolchains!) installed in the image. However, this is not a good idea for production images because it increases the image size and the attack surface:
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/dockerize-python-application/__static__/single-stage-python.png" width="400" alt="single-stage-python" > </p>
>
> To separate the build- and runtime dependencies, a **multi-stage Docker build** can be used:
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/dockerize-python-application/__static__/multi-stage-build.png" width="400" alt="multi-stage-build" > </p>
>
> If you're not familiar with this technique, check out this tutorial on [how to produce smaller container images with multi-stage builds](https://labs.iximiuz.com/tutorials/docker-multi-stage-builds).

> **Hint #3:**
>
> Traditionally, Python **virtual environments** (*venv*) have been used to isolate a project's dependencies from system-wide Python packages and those installed by other projects. Since containers are inherently single-tenant, it might seem unnecessary to use virtual environments in containerized Python applications. However, that's not entirely true. A fully self-contained virtual environment, including all required dependencies, [can serve as a convenient build artifact, making it easy to transfer from the build stage to the runtime stage](https://pythonspeed.com/articles/multi-stage-docker-python/).

> **Hint #4:**
>
> When splitting a Dockerfile into multiple stages, you should carefully examine the shared libraries that are installed by the ``apt-get`` or the like command - some of them are only needed to build the application, while others might also be needed at runtime.
> 
> Example:
```dockerfile
# Build stage
RUN apt-get install -y libcairo2 libcairo2-dev

# Runtime stage
RUN apt-get install -y libcairo2
```

> **Hint #5:**
>
> One of the tricky parts when containerizing a Python application is choosing the right base image for the runtime stage. You can find many variants of Python base images, but not all of them are suitable for production use:
> - ``python:latest``, ``python:<ver>``, ``python:<major>.<minor>`` should be avoided for production use.
> - ``python:<version>-slim`` is a good pragmatic choice for both build and runtime stages.
> - ``python:alpine`` can be a good choice but requires extra caution due to the ``musl`` vs. ``glibc`` compatibility issues.
> - [ubuntu/python](https://hub.docker.com/r/ubuntu/python) is an "alternative" minimal Python base image that uses a **chiseled** Ubuntu base.
> - [gcr.io/distroless/python3](https://labs.iximiuz.com/tutorials/gcr-distroless-container-images) is a good choice for highly-regulated and security-sensitive environments.
> - [chainguard/python](https://hub.docker.com/r/chainguard/python) is another good "distroless" Python base image (but only the ``latest`` tag can be used for free).
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/dockerize-python-application/__static__/python-3-image.png" width="400" alt="python-3-image" > </p>

## **Source**

[Build a Production-Ready Python Container Image: FastAPI Application](https://labs.iximiuz.com/challenges/dockerize-python-application)

## **[Back to Home](../../)**