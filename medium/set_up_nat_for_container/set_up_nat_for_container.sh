#!/usr/bin/env bash

sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -s 172.18.0.0/16 -o eth0 -j MASQUERADE