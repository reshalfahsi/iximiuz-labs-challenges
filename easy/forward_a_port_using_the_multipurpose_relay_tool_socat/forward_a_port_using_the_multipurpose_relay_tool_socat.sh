#!/usr/bin/env bash

socat TCP-LISTEN:6000,bind=0.0.0.0,reuseaddr,fork TCP:127.0.0.1:5000