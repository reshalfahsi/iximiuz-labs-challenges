#!/usr/bin/env bash

cd app
docker build -t app:latest .
docker run --name test app
docker stop test