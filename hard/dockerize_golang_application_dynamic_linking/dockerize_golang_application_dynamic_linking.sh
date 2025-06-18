#!/usr/bin/env bash

cd app

vim Dockerfile
vim .dockerignore

make docker-build
# make docker-run