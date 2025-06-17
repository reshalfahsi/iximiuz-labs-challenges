#!/usr/bin/env bash

# Initialize the Dagger Module with an SDK
# Navigate to the project root:
cd ~/my-project

# Initialize the Dagger module
dagger init --sdk go
ls -a

# Edit the main.go in .dagger
vim .dagger/main.go

# Verify
dagger call build --src . --arch arm64 export --path ./server