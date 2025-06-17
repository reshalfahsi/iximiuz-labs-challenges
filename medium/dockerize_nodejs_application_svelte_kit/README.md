# **Build a Production-Ready Node.js Container Image: SvelteKit Application**

You are tasked with optimizing the container image for a SvelteKit application. The application is a simple web service with a front page and a few API endpoints. The source code of the application is located in the ``~/app`` directory, along with an initial Dockerfile.

You can use the ``npm run docker:build`` script to build the image and ``npm run docker:run`` to run the container. However, the current setup does not adhere to containerization best practices. Your goal is to improve the Dockerfile and create a production-ready container image.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/dockerize-nodejs-application-svelte-kit/__static__/container-image.png" width="400" alt="container-image" > 
</p>

Build a Docker image named ``registry.iximiuz.com/app:v1.0.0`` that meets the following requirements:

1. Base Image:
    - Use an optimal Node.js base image.
    - Ensure the Node.js version is the active LTS version.
2. Security:
    - The image must run as a non-root user.
    - Include only necessary packages and files.
3. Performance:
    - The final image size must not exceed ``300 MB``.
4. Runtime:
    - The container should not depend on ``npm`` at runtime.
    - The application must:
        - Listen on ``0.0.0.0:3000``.
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
> Modern Node.js applications tend to depend on lots of packages. Some of these packages (e.g., linters, formatters, etc.) are needed only during the development time, while others (e.g., the framework's runtime, libraries, etc.) are needed at production time, too.
> 
> The ``node_modules`` folder containing both development and production dependencies is usually quite large, and it should never be included in the production container image.
> 
> Some frameworks, like Next.js ([src](https://nextjs.org/docs/pages/api-reference/config/next-config-js/output#automatically-copying-traced-files)) or Nuxt ([src](https://nuxt.com/docs/guide/concepts/server-engine#standalone-server)) have a way to produce a **standalone build** of the application, packaging only the needed dependencies from the ``node_modules`` folder in the build output. As a result, the production build of the application doesn't require the ``node_modules`` folder at all.
> 
> SvelteKit can also produce a standalone build, but only if all dependencies are defined in the ``devDependencies`` section in the ``package.json`` file (which is not always possible). If some packages are listed in the ``dependencies`` section, the container image will have to also include the ``node_modules`` folder. But make sure it contains only the production dependencies!
>
> To separate the build- and runtime dependencies, a **multi-stage Docker build** can be used:
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/dockerize-nodejs-application-svelte-kit/__static__/multi-stage-build.png" width="400" alt="multi-stage-build" > </p>
>
> If you're not familiar with this technique, check out this tutorial on [how to produce smaller container images with multi-stage builds](https://labs.iximiuz.com/tutorials/docker-multi-stage-builds).

> **Hint #3:**
>
> One of the tricky parts when containerizing a Node.js application is choosing the right base image for the runtime stage. You can find many variants of Node.js base images, but not all of them are suitable for production use. If you don't know what option is best for your case, check out this material on [how to choose a Node.js container image for your application](https://labs.iximiuz.com/tutorials/how-to-choose-nodejs-container-image).
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/dockerize-nodejs-application-svelte-kit/__static__/nodejs-container-images-v3.png" width="400" alt="nodejs-container-images-v3" > </p>

> **Hint #4:**
>
> Wondering why the image should not depend on ``npm`` at runtime? First of all, it's an extra dependency that you probably don't even want to have in the production image because it increases the image size and the attack surface. Second, it often messes with the graceful termination of the container:
> <p align="center"> <img src="https://labs.iximiuz.com/content/files/challenges/dockerize-nodejs-application-svelte-kit/__static__/entrypoint-cmd-npm.png" width="400" alt="entrypoint-cmd-npm" > </p>
>
> Check out this challenge for more details: [Ensure a Graceful Termination for a Containerized Node.js Application](https://labs.iximiuz.com/challenges/graceful-termination-for-nodejs-container)

## **Source**

[Build a Production-Ready Node.js Container Image: SvelteKit Application](https://labs.iximiuz.com/challenges/dockerize-nodejs-application-svelte-kit)

## **[Back to Home](../../)**