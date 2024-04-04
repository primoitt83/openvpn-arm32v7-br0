#!/bin/bash
## check br0
test=$(ip a |grep br0:)

## check if $test is not empty
if [ ! -z "$test" ]; then 
    ## interface br0 is up
    docker-compose exec openvpn-br0 openvpn-bridge stop
fi

## stop openvpn
docker-compose down