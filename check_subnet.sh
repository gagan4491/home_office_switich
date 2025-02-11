#!/bin/bash

# Path to the main script
MAIN_SCRIPT="/Users/gsingh/PycharmProjects/home_office/check_ip.sh"

# File to store the last known IP address
LAST_IP_FILE="/tmp/last_ip.txt"

# Get the primary IP address
CURRENT_IP=$(/sbin/ifconfig en0 | grep 'inet ' | awk '{print $2}')

# Read the last IP address
if [ -f "$LAST_IP_FILE" ]; then
    LAST_IP=$(cat "$LAST_IP_FILE")
else
    LAST_IP=""
fi

# Save the current IP address for next time
echo "$CURRENT_IP" > "$LAST_IP_FILE"

# Check if the IP address has changed
if [ "$CURRENT_IP" != "$LAST_IP" ]; then
    echo "Subnet has changed or is being checked for the first time."
    # Run the main script
    bash "$MAIN_SCRIPT"
else
    echo "No change in subnet."
fi
