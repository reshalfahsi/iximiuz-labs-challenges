#!/usr/bin/env bash

# Step 1: Identify the Pod and Container (and confirm it's running)

kubectl get pods simple

# To see container names within the pod (if needed, though often for a 
# "simple" pod there's just one primary container)
# Look under the Containers: section. If there's only one, 
# you don't need to specify it with kubectl exec.
kubectl describe pod simple

# Step 2: Find the Process ID (PID) of the application inside the container
kubectl exec -it simple -- ps aux

# Step 3: Send the signal to the application process
# Sends the SUGUSR1 signal to process with PID 1 inside the container.
# The SIGUSR1 signal (Signal User Defined 1) is a user-defined signal 
# in Unix-like operating systems (including Linux).
# - User-Defined: Unlike common signals like SIGTERM (terminate gracefully),
#   SIGKILL (force kill), SIGHUP (hangup/reload config), or SIGINT 
#   (interrupt from Ctrl+C), SIGUSR1 (and SIGUSR2) do not have a 
#   predefined, standard meaning or behavior enforced by the operating 
#   system kernel.
# - Purpose: Their purpose is entirely left to the application developer. 
#   A programmer can write code within their application to specifically 
#   "catch" or "handle" the SIGUSR1 signal and define what the program 
#   should do when it receives it.
# Common signals include:
# - SIGTERM (15): Graceful shutdown (the default if no signal is specified).
# - SIGHUP (1): Often used to reload configuration.
# - SIGKILL (9): Immediate, ungraceful termination (use with caution).
kubectl exec -it simple -- kill -SIGUSR1 1

# Using the signal number (also valid, SIGUSR1 is signal 10)
# kubectl exec -it simple -- kill -10 1