# **Deploy a Resource-Greedy Pod Without Breaking the Kubernetes Cluster**

The ``ghcr.io/iximiuz/labs/resource-hog/herder:v1.0.0`` image contains a "resource hog" application that gradually consumes all CPU and RAM resources on the host machine, eventually leading to the host's unavailability. Your task is to deploy this resource-greedy container to a Kubernetes cluster and make it run for a while without disrupting the service.

- Deploy a standalone Pod called ``hoggy`` to the ``default`` namespace.
- Ensure the Pod restarts automatically upon crash or termination.
- The Pod must not consume more than 250m of the node's CPU and 500Mi of RAM.

Good luck!

## **Hint**

This is a basic Kubernetes Pod configuration task. Refer to the [Kubernetes documentation](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) to learn how to configure Pod CPU and memory resources.

## **Source**

[Deploy a Resource-Greedy Pod Without Breaking the Kubernetes Cluster](https://labs.iximiuz.com/challenges/start-pod-with-limited-resources)

## **[Back to Home](../../)**