#!/bin/bash
## check image
test=$(docker images |grep openvpn-arm32v7-br0)

## check if $test is not empty
if [ ! -z "$test" ]; then 
    ## image exists
    docker-compose up -d
else
    ## image doesnt exists
    docker-compose build --no-cache
    docker-compose up -d
fi