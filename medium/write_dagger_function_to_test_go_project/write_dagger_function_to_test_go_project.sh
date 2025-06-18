#!/usr/bin/env bash

# Initialize the Dagger Module with an SDK
# Navigate to the project root:
cd ~/todolist

# Initialize the Dagger module
dagger init --sdk go
ls -a

# Edit the main.go in .dagger
vim .dagger/main.go

# Verify
dagger call test --src . stdout
dagger call test --src . --run NoSuchTest stdout
dagger call test --src . --run CreateTodo --count 10 stdout
