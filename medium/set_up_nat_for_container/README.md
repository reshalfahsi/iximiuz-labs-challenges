# **Set Up Network Address Translation (NAT) for a Container**

There is an improvised "container" implemented with a network namespace. You can see it in the ``ip netns list`` output. It seems to have access to all host's interfaces but for some reason cannot call any addresses outside of the host. Can you fix it?

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/set-up-nat-for-container/__static__/container-nat.png" width="400" alt="container-nat" > 
</p>

## **Hint**

### **Hint #1**

When a packet destined for the Internet leaves the container, it has the source IP address set to the container's IP. This address is local to the host, and the Internet destination simply wouldn't know how to reply to it because there are billions of ``172.18.0.2`` devices out there.

### **Hint #2**

You need to replace the source IP address of the packet with the host's IP address before it leaves the host. This technique is known as Source Network Address Translation (sNAT).

### **Hint #3**

Still feeling lost? The keywords are ``iptables`` and ``MASQUERADE``.

### **Hint #4**

Added a masquerade rule but the container still cannot ping the Internet? Make sure the host is configured to forward packets between interfaces. By default, it's usually not.

## **Source**

[Set Up Network Address Translation (NAT) for a Container](https://labs.iximiuz.com/challenges/set-up-nat-for-container)

## **[Back to Home](../../)**