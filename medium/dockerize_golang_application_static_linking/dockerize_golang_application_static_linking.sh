#!/usr/bin/env bash

cd app
vim Dockerfile
make docker-build
# make docker-run