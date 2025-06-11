# **Diagnose and Resolve Stability Issues in a Go Application Deployment**

A Go application is deployed in the cluster. It's a simple HTTP server that consumes around ``100MB`` of memory per request. The application is under constant load from a small number of clients. The ops team has set a memory limit of ``512MB``, assuming it would be sufficient. However, it has made the application repeatedly crash after serving about half a dozen requests.

Your task is to identify the root cause of the crash loop and implement a fix.

Key Points:

- The application runs in a ``single-pod`` deployment called ``memhog``.
- The deployment is exposed via a ``ClusterIP`` service.
- The pod is subjected to a constant load of 4 concurrent requests.
- The goal is to ensure the application successfully serves at least 99 requests out of every 100 requests it receives.

Constraints:

- You cannot change the composition of the application.
- You should preserve the original memory limit of ``512MB``.
- You are not allowed to change the container image or the pod's entrypoint.
- You may adjust other aspects of the pod specification as needed.

Good luck! 🎯

## **Hint**

### **Hint #1**

The first thing you should do is to check the logs of the ``memhog`` pod and its status. Do you see any errors or warnings that might indicate the cause of the crash?

### **Hint #2**

With just 4 concurrent requests and ``100MB`` of memory per request, ``512MB`` of memory should be more than enough. Nevertheless, the pod gets OOM-killed. Can you think of any reasons why this might happen?

### **Hint #3**

You cannot change the application and the pod's memory limit. What else can be changed that would have an effect on the pod's memory usage?

### **Hint #4**

[Kubernetes pods are not very different from regular containers](https://labs.iximiuz.com/tutorials/containers-vs-pods). A Linux container provides a virtualized environment for the application, tricking it into thinking it has a dedicated "machine" to run on. However, some resources are virtualized better than others.

For example, a containerized app gets a fully isolated root filesystem and a set of network interfaces, but it keeps seeing the same amount of CPU cores and memory that the host machine has. And at the same time, the container's [CPU and memory usage can be limited via cgroups](https://labs.iximiuz.com/tutorials/controlling-process-resources-with-cgroups).

This all can easily confuse the application runtime, because most of the languages haven't been designed with containers in mind. The estimated memory usage of our application is ``4 x 100MB = 400MB`` (plus some negligible overhead for the runtime). Would the application with such memory usage crash if it ran on an actual machine with only ``512MB`` of memory?

### **Hint #5**

The application is written in Go. Go is a garbage-collected language, so the extra memory usage likely comes from the not yet freed memory. Can you think of a way to make the garbage collector run more frequently?

### **Hint #6**

From Go's own [Guide to the Go Garbage Collector](https://tip.golang.org/doc/gc-guide):

```
Do take advantage of the memory limit when the execution
environment of your Go program is entirely within your
control, and the Go program is the only program with access
to some set of resources (i.e. some kind of memory
reservation, like a container memory limit).
```

This is exactly the case for our application.

Another great read that might help you to solve this challenge is [GOMEMLIMIT is a game changer for high-memory applications](https://weaviate.io/blog/gomemlimit-a-game-changer-for-high-memory-applications).

<p align="center"> 
    <img src="https://labs.iximiuz.com/content/files/challenges/fix-go-app-container-oom/__static__/gomemlimit.png" width="400" alt="gomemlimit" > 
</p>

## **Source**

[Diagnose and Resolve Stability Issues in a Go Application Deployment](https://labs.iximiuz.com/challenges/fix-go-app-container-oom)

## **[Back to Home](../../)**