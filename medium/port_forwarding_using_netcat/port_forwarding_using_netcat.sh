#!/bin/bash

while true; do nc -l -p 6000 -c "nc 127.0.0.1 5000"; done

# 1. nc -l -p 6000: Starts netcat in listening mode (-l) on 
#    port 6000 (-p 6000).
#
# 2. -c "nc 127.0.0.1 5000": Uses the -c flag to execute a command upon 
#    receiving a connection. For each incoming connection on port 6000, 
#    netcat spawns a new nc instance that connects to 127.0.0.1:5000, 
#    forwarding data between the client and the HTTP service.
#
# 3. while true; do ... done: Wraps the command in an infinite bash loop 
#    to restart the listener after each connection closes.