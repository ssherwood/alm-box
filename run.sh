#!/usr/bin/env bash

#if [ "$(id -u)" != "0" ]; then
#   echo "This script must be run as root" 1>&2
#   exit 1
#fi

export DOCKERHOST=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)

# You should use DOCKERHOST env variable in your `docker-compose.yml` 
# and put it everywhere you want to connect to `localhost` of the host machine
docker-compose $@