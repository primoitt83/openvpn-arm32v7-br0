#!/bin/bash
# enable debug
set -x

## first run openvpn
openvpn --daemon --config /etc/openvpn/openvpn.conf

## then run bridge
#openvpn-bridge start

