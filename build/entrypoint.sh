#!/bin/bash
## enable debug
set -x

## first create dev
if [ ! -c /dev/net ]; then
    mkdir -p /dev/net
    if [ ! -c /dev/net/tun ]; then
        mknod /dev/net/tun c 10 200
    fi
di

## run openvpn-bridge before openvpn
openvpn-bridge start

## run openvpn
openvpn --config /etc/openvpn/openvpn.conf