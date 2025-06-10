#!/usr/bin/env bash

sudo systemd-run --scope -p CPUQuota=10% -p MemoryMax=500M omnihog