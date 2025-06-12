# **Copy Files To/From a Running Docker Container**

In this challenge, there is a running Nginx container named ``web``. Whoever started it forgot to add the required ``nginx.conf`` file to the container. Your task is to copy the config file to the ``web`` container without restarting it. After that, you will need to copy the ``nginx`` binary from the container to the host for further analysis by the security team.

- You can access the container from the host at ``localhost:8080``.
- The correct config file is located on the host at ``~/nginx.conf``.
- The config file in the container is located at ``/etc/nginx/nginx.conf``.
- Use ``docker exec web nginx -s reload`` to trigger a config reload.
- The Nginx binary is located in the container at ``/usr/sbin/nginx``.
- Copy the Nginx binary to the host at ``~/nginx-bin``.

Good luck!

## **Hint**

It's an easy task - ``docker cp --help`` will help you out 😉

## **Source**

[Copy Files To/From a Running Docker Container](https://labs.iximiuz.com/challenges/copy-files-to-from-container)

## **[Back to Home](../../)**