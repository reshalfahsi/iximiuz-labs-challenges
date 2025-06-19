# **Forward a Port Using the Hackers' Swiss Army Knife: netcat**

Similar to the [socat challenge](https://labs.iximiuz.com/challenges/port-forwarding-using-socat), you need to make an already running service available on a different port. However, this time you'll have to use the ``nc`` command.

There is an HTTP service listening on port ``127.0.0.1:5000``. Your task is to map this address to ``0.0.0.0:6000``. You're not allowed to change the service configuration or restart it.

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/port-forwarding-using-netcat/__static__/user-space-port-forwarding.png" width="400" alt="user-space-port-forwarding" > 
</p>

> **Hint #1:**
>
> ``netcat`` is a versatile networking utility that, in particular, can be used to start a listening TCP socket.

> **Hint #2:**
>
> Unlike ``socat``, ``netcat`` doesn't have a built-in proxy mode where connections are accepted on one port and forwarded to another. However, with ``netcat`` you can perform arbitrary commands upon receiving a connection. The data received from the client will be forwarded to the ``stdin`` of such command.

> **Hint #3:**
>
> ``netcat`` can also be used to connect to a TCP socket and forward data from the ``stdin``.

> **Hint #4:**
>
> How about combining the two previous hints? 😉

> **Hint #5:**
>
> Not every version of ``netcat`` supports staying listening for another connection after its current connection is completed. If the ``-k`` option is not available, you'll have to be a bit more creative.

> **Hint #6:**
>
> Use ~~the force~~ a bash loop, Luke! 🚀

## **Source**

[Forward a Port Using the Hackers' Swiss Army Knife: netcat](https://labs.iximiuz.com/challenges/port-forwarding-using-netcat)

## **[Back to Home](../../)**