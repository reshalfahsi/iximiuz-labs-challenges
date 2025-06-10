# **Install Docker Engine on Fedora**

Docker comes in two flavors:

- [Docker Desktop](https://docs.docker.com/desktop/) - a GUI application for Mac, Windows, and Linux that, among other things, includes an instance of Docker Engine.

- [Docker Engine](https://docs.docker.com/engine/) - the core component that is typically used on Linux servers (and within Docker Desktop) to run containers.

In this challenge, you will practice installing Docker Engine on a Fedora virtual machine.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/docker-install-on-fedora/__static__/docker-architecture.png" alt="docker-architecture" > 
</p>

To highlight the multi-component nature of Docker, the challenge is divided into multiple tasks, each verifying a different aspect of the installation.

Once the ``containerd`` and ``dockerd`` daemons are installed, you may need to explicitly start them.

An important part of the Docker installation is the ``docker`` command-line client (CLI). For many users, this CLI _is_ Docker Engine (while the ``dockerd`` daemon is just an obscure background component).

While the ``docker`` CLI itself is rather a "fat" client, some common functionality is implemented as plugins, and the two most popular ones are ``buildx`` and ``compose``.

The ``dockerd`` daemon runs as ``root`` and exposes its API via a Unix socket with the corresponding file permissions. To interact with the daemon using the ``docker`` CLI, users must either use ``sudo`` or be added to the ``docker`` group.

Final check – verifying that the Docker installation is working as expected.

## ** Source **

[Install Docker Engine on Fedora](https://labs.iximiuz.com/challenges/docker-install-on-fedora)

## **[Back to Home](../../)**