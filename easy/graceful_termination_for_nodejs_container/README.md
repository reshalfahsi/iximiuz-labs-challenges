# **Ensure a Graceful Termination for a Containerized Node.js Application**

There is a simple containerized Node.js server in the ``~/app`` directory. When started, the application works as expected, but there seems to be an issue with the container's termination process. The ``docker stop`` command hangs for a few seconds and eventually results in the container being forcibly killed without performing the expected shutdown sequence.

Your task is to rebuild the application image so that the container exits gracefully when the ``docker stop`` command is received, while keeping the server code itself unchanged.

Key Points:

- You may modify the ``Dockerfile`` and the ``package.json`` files.
- You can rebuild the ``app:latest`` image as many times as needed.
- The server code itself must not be modified.
- A simple ``docker run app`` command (without any extra arguments) should start the container.
- A simple ``docker stop`` command should stop the container gracefully.
- The container name ``test`` is reserved for the verification process - make sure you use a different container name while debugging.

Good luck!

## **Hint**

Scripts from the ``package.json`` file, such as ``start`` or ``test``, are typically executed by ``npm`` in sub-shells. This is convenient during development but can cause issues in production. When a shell sits in the process tree, signals can easily get lost. You need to find a way to make the container's main process the Node.js server itself.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/graceful-termination-for-nodejs-container/__static__/entrypoint-cmd-npm.png" width="400" alt="entrypoint-cmd-npm" > 
</p>

## **Source**

[Ensure a Graceful Termination for a Containerized Node.js Application](https://labs.iximiuz.com/challenges/graceful-termination-for-nodejs-container)

## **[Back to Home](../../)**