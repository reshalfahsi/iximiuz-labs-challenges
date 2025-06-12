#!/usr/bin/env bash

# Enter the PID of the process that is listening on port 12345
sudo netstat -tulnp | grep :12345