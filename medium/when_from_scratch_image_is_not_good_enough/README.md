# **When a FROM scratch Container Image Is Not Good Enough**

In this challenge, you'll need to troubleshoot a misbehaving container, identify the problem, and then restart the container, potentially rebuilding its image, to make the containerized application actually work.

The application is a simple web server that, upon receiving a request, calls the [GitHub status API](https://www.githubstatus.com/api/v2/status.json) and proxies the response back to the client. You can access the application at ``http://localhost:8080``.

The following conditions should be met for the solution to be accepted:

- The application container should be named ``status-checker``.
- The application container should be listening on port ``8080``.
- The unmodified ``server`` binary from the original image must be used.

Additionally, you'll need to make sure that the container still adheres to DevOps best practices:

- The container image size should be less than 50MB.
- There should be no shell in the container.

You can start, stop, and remove the container as many times as you want, using its original image or replacing it with your own.

Good luck!

> **Hint #1:**
>
> Try sending an HTTP request to the application. The response may contain a clue.

> **Hint #2:**
>
> Even when your application is a single statically linked binary, building a container image ``FROM scratch`` might be not the best idea.


> **Hint #3:**
>
> Have you read this [tutorial on GoogleContainerTools' distroless images](https://labs.iximiuz.com/tutorials/gcr-distroless-container-images)? It might help.
> <p align="center"><img src="https://labs.iximiuz.com/content/files/challenges/when-from-scratch-image-is-not-good-enough/__static__/distroless-hierarchy-rev2.png" width="400" alt="distroless-hierarchy-rev2" ></p>

## **Source**

[When a FROM scratch Container Image Is Not Good Enough](https://labs.iximiuz.com/challenges/when-from-scratch-image-is-not-good-enough)

## **[Back to Home](../../)**