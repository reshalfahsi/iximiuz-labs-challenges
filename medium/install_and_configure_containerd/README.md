# **Install and Configure containerd on a Linux Host**

In this challenge, you will need to install and configure containerd on a Linux host. Follow the steps below to complete the challenge.

<p align="center">
    <img src="https://labs.iximiuz.com/content/files/challenges/install-and-configure-containerd/__static__/containerd-components-rev2.png" width="400" alt="containerd-components-rev2" >
</p>

First things first, obtain relatively fresh containerd binaries.

> **Hint #1:**
>
> One of the main installation options mentioned in the official [Getting started with containerd](https://github.com/containerd/containerd/blob/main/docs/getting-started.md) guide is to download containerd binaries from the project's [GitHub Releases](https://github.com/containerd/containerd/releases) page.

> **Hint #2:**
>
> Installing the [containerd.io package](https://docs.docker.com/engine/install/ubuntu/) (maintained by Docker) is also an option, but you'll likely get a more dated version of the daemon.

With the containerd binaries in place, start containerd as a systemd service.

> **Hint #3:**
>
> The maintainers of the containerd project kindly provide a [systemd unit file](https://github.com/containerd/containerd/blob/main/containerd.service) that you can use to launch containerd on your system.

Surprisingly or not, containerd itself cannot run any containers - it needs a lower-level container runtime for that. Install an OCI-compatible container runtime, such as ``runc`` or ``crun``.

> **Hint #4:**
>
> If you choose to install ``runc``, it should be as simple as downloading a statically linked binary from the [GitHub Releases](https://github.com/opencontainers/runc/releases) page, placing it in one of the directories in your ``$PATH``, and making it executable.

Neither containerd nor ``runc`` can do container networking by themselves - they need CNI plugins to be present on the host. Install the CNI plugins and configure a [bridge network](https://labs.iximiuz.com/tutorials/container-networking-from-scratch) with the following parameters:

- Bridge name: ``bridge0``
- Host-local IPAM
    - Subnet: ``172.18.0.0/24``
    - Gateway: ``172.18.0.1``

> **Hint #5:**
>
> To install the CNI plugins, you can download the release binaries from the [GitHub Releases](https://github.com/containernetworking/plugins/releases) page and extract them to ``/opt/cni/bin``.

> **Hint #6:**
>
> containerd expects the CNI configuration files to be present in ``/etc/cni/net.d``. There are many ways to configure a bridge CNI network, but the following is a good starting point:

```json
{
  "type": "bridge",
  "bridge": "bridge0",
  "name": "bridge",
  "isGateway": true,
  "ipMasq": true,
  "ipam": {
    "type": "host-local",
    "ranges": [
      [{"subnet": "172.18.0.0/24"}]
    ],
    "routes": [{"dst": "0.0.0.0/0"}]
  },
  "cniVersion": "1.0.0"
}
```

Finally, start an Nginx container with full networking support using the ``ctr`` CLI.

> **Hint #7:**
>
> With ``ctr``, you have to explicitly [pull the image](https://labs.iximiuz.com/courses/containerd-cli/ctr/image-management#basics) before you can start a container.

> **Hint #8:**
>
> By default, [ctr run](https://labs.iximiuz.com/courses/containerd-cli/ctr/container-management#basics) will not enable networking for the container. You can use the ``--cni`` flag to enable the use of CNI plugins.

## **Source**

[Install and Configure containerd on a Linux Host](https://labs.iximiuz.com/challenges/install-and-configure-containerd)

## **[Back to Home](../../)**