#!/bin/bash
## enable debug
set -x

## first create dev
if [ ! -c /dev/net ]; then
    mkdir -p /dev/net
    if [ ! -c /dev/net/tun ]; then
        mknod /dev/net/tun c 10 200
    fi
fi

## populate openvpn-brigde vars
sed -i "s/ETH/$ETH/g" /usr/local/bin/openvpn-bridge
sed -i "s/IP_NETMASK/$IP_NETMASK/g" /usr/local/bin/openvpn-bridge
sed -i "s/BROADCAST/$BROADCAST/g" /usr/local/bin/openvpn-bridge
sed -i "s/GATEWAY/$GATEWAY/g" /usr/local/bin/openvpn-bridge

## run openvpn-bridge before openvpn
openvpn-bridge start

## always copy conf file from volume "config"
cp /config/openvpn.conf /etc/openvpn/openvpn.conf

## run openvpn
openvpn --config /etc/openvpn/openvpn.conf