#!/bin/bash

ip=`route -n | grep UG | tr -s " " | cut -f 2 " "`
ping="/bin/ping"
echo "Checking to see $ip is up..."


