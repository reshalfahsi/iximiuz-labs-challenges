# **Copy Files To/From a Running Kubernetes Pod: a Simple Case**

There is an Nginx Pod called ``web`` running in the ``default`` namespace. Whoever started it forgot to add the required ``nginx.conf`` file to its container. Your task is to copy the config file to the Pod without restarting it. After that, you will need to copy the ``nginx`` binary from the Pod to the host for further analysis by the security team.

- You can access the Nginx server at Pod's IP address on port 80.
- The correct config file is located on the host at ``~/nginx.conf``.
- The config file in the Pod is located at ``/etc/nginx/nginx.conf`` in the ``server`` container.
- Use ``kubectl exec web -- nginx -s reload`` to trigger a config reload.
- The Nginx binary is located in the ``server`` container of the ``web`` Pod at ``/usr/sbin/nginx``.
- Copy the Nginx binary to the host at ``~/nginx-bin``.

Good luck!

## **Hint**

It's an easy task - ``kubectl cp --help`` will help you out 😉

## **Source**

[Copy Files To/From a Running Kubernetes Pod: a Simple Case](https://labs.iximiuz.com/challenges/copy-files-to-from-kubernetes-pod)

## **[Back to Home](../../)**