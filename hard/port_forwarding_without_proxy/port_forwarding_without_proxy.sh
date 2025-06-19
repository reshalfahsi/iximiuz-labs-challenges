#!/usr/bin/env bash

sudo iptables -t nat -A PREROUTING -p tcp --dport 6000 -j DNAT --to-destination 192.168.0.2:5000
sudo iptables -t nat -A OUTPUT -p tcp --dport 6000 -j DNAT --to-destination 192.168.0.2:5000