#!/bin/bash

# Get a list of all network interfaces
interfaces=$(ip link show | awk '/^[0-9]+:/{print substr($2, 1, length($2)-1)}')

# Iterate over each interface and retrieve its MAC address
for interface in $interfaces; do
    mac_address=$(ip link show $interface | awk '/ether/ {print $2}')
    echo "Interface: $interface, MAC Address: $mac_address"
done
