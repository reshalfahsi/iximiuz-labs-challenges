#!/usr/bin/env bash

# Initialize the Dagger Module with an SDK
# Navigate to the project root:
cd ~/my-project

# Initialize the Dagger module
dagger init --sdk python
ls -a
# Edit the main.py in my-project/.dagger/src/my_project

# Verify the Functions
dagger functions