#!/bin/bash

# Find Ethernet and PPP interfaces dynamically
eth_interface=$(ip link show | grep -B 1 "link/ether" | head -n 1 | awk '{print $2}' | tr -d ':')
ppp_interface=$(ip link show | grep -B 1 "link/ppp" | head -n 1 | awk '{print $2}' | tr -d ':')

# Check if the interfaces are not empty
if [[ -z "$eth_interface" || -z "$ppp_interface" ]]; then
    echo "Required interfaces could not be found."
    exit 1
fi

# Applying iptables rules
echo "Applying iptables rules for interfaces $eth_interface and $ppp_interface..."

sudo iptables -A FORWARD -i $eth_interface -o $ppp_interface -j ACCEPT
sudo iptables -A FORWARD -i $ppp_interface -o $eth_interface -j ACCEPT
sudo iptables -t nat -A POSTROUTING -o $ppp_interface -j MASQUERADE

echo "iptables rules have been applied successfully."
