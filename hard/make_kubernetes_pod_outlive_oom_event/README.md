# **Make a Kubernetes Pod Survive an OOM Event Without Restarting**

When you [limit the memory usage of a multi-process Docker container](https://labs.iximiuz.com/challenges/kill-container-on-child-process-oom-event-docker), the OOM killer often terminates only one of the processes if the container runs out of memory. If this process is not the topmost process of the container (PID 1), the container will keep running, which may or may not be desirable.

[Pods consist of containers](https://labs.iximiuz.com/tutorials/containers-vs-pods), and originally, this OOM killer behavior was present in Kubernetes, too. When a Pod's container with limited resources and multiple processes inside would run out of memory, the OOM killer would terminate only some of the processes, often leaving the container (hence, the Pod) running.

This made some of us start [tracking down "invisible" OOM kills](https://medium.com/@reefland/tracking-down-invisible-oom-kills-in-kubernetes-192a3de33a60), hunting [zombie Pods](https://www.reddit.com/r/kubernetes/comments/17icbkc/kubernetes_linux_kernel_kills_my_sub_process_for/), and dodging [silent Pod killers](https://itnext.io/kubernetes-silent-pod-killer-104e7c8054d9), so in Kubernetes 1.28, the OOM behavior [was](https://github.com/kubernetes/kubernetes/issues/117070) [changed](https://github.com/kubernetes/kubernetes/pull/117793) to terminate the entire container if any of its processes runs out of memory.

However, while improving things for some workloads, in perfect agreement with [Hyrum's Law](https://www.hyrumslaw.com/), this change broke [some other workloads](https://github.com/kubernetes/kubernetes/pull/117793#issuecomment-2059012668), and [outages followed](https://github.com/kubernetes/kubernetes/pull/117793#issuecomment-2059012668). So, naturally, a requirement arose to tweak the OOM killer behavior depending on the workload's needs.

The problem is that the change in Kubernetes 1.28 was unconditional, and neither Kubernetes API nor kubelet config could be used to restore the pre-1.28 OOM killer behavior. [In Kubernetes 1.32, a kubelet config flag singleProcessOOMKill was added](https://github.com/kubernetes/kubernetes/blob/master/CHANGELOG/CHANGELOG-1.32.md) to restore the pre-1.28 OOM killer behavior, but it only works at node-level granularity. Thus if some workloads in your cluster need the pre-1.28 OOM killer behavior, while others perform better with the new behavior, this flag is not very useful.

But there is always a *way*!

In this challenge, you will need to deploy a multi-process container to the Kubernetes cluster, and make it tolerate the OOM killer terminating its sub-processes **without changing the kubelet config**. As a result, you'll develop a solution that can be applied conditionally to only some workloads, and that will work on all Kubernetes versions (including the 1.28-1.31 range).

The image you will need to use is ``ghcr.io/iximiuz/labs/resource-hog/herder:v1.0.0``. It's a "resource hog" application that gradually consumes all CPU and RAM resources on the host machine, eventually leading to the host's unavailability if deployed without proper limits set.

Your task is to deploy this resource-greedy container to a Kubernetes cluster and make it run for a while without restarts or crashes:

- Run the application as a Deployment called ``herder`` in the ``default`` namespace.
- The Deployment must have at least as many replicas as there are nodes in the cluster.
- Every Pod must run on its own node.
- No Pods should consume more than 250m of the node's CPU and 256Mi of RAM.
- The Deployment must run for at least 60 seconds without a single Pod restart.

Good luck!

> **Hint #1:**
>
> Don't know how to limit the resources of a Pod? Solving this simpler challenge first may help you - [Deploy a Resource-Greedy Pod Without Breaking the Kubernetes Cluster](https://labs.iximiuz.com/challenges/start-pod-with-limited-resources)

> **Hint #2:**
>
> You can learn about the involved cgroup machinery by solving this challenge first - [Kill the Entire Process Group When One Process Runs Out of Memory](https://labs.iximiuz.com/challenges/kill-process-group-on-oom-event)

> **Hint #3:**
>
> Can you think of a way to write to the ``memory.oom.group`` file of the ``herder`` Pod on a given node? On all nodes? In an automated way?

> **Hint #4:**
>
> Use ~~the force~~ [a privileged DaemonSet](https://github.com/kubernetes/kubernetes/pull/117793#issuecomment-2199463469), Luke.

## **Source**

[Make a Kubernetes Pod Survive an OOM Event Without Restarting](https://labs.iximiuz.com/challenges/make-kubernetes-pod-outlive-oom-event)

## **[Back to Home](../../)**