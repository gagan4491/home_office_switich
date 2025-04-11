#!/bin/bash
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

print_separator() {
    local width=$(tput cols)  # Get terminal width dynamically
    local stars=$(printf '%*s' "$width" | tr ' ' '*')  # Generate full-width stars
    echo "$stars"
    echo "$stars"
}

# Now you can use commands like `ifconfig` and `route` directly
echo "Checking route..."
netstat -nr

print_separator

echo "Checking network configuration..."
ifconfig | grep 'bridge'
print_separator

sleep 10

# Get the primary IP address
IP=$(/sbin/ifconfig en0 | grep 'inet ' | awk '{print $2}')

# Define subnet prefixes
SUBNET1="192.168.101."
SUBNET2="192.168.100."



if [[ "$IP" == "$SUBNET1"* || "$IP" == "$SUBNET2"* ]]; then
    echo "IP belongs to both subnets. Running first operation..."
    print_separator
    
    /Applications/UTM.app/Contents/MacOS/utmctl stop office
    /Applications/UTM.app/Contents/MacOS/utmctl stop london
    /Applications/UTM.app/Contents/MacOS/utmctl stop prod

    sleep 20

    /Applications/UTM.app/Contents/MacOS/utmctl start london
    /Applications/UTM.app/Contents/MacOS/utmctl start prod
    sleep 10

    /Users/gsingh/Documents/delete.sh
    /Users/gsingh/Documents/addRoute-office.sh

    print_separator

else
    echo "IP does not belong to both subnets. Running second operation..."
    print_separator

    /Applications/UTM.app/Contents/MacOS/utmctl stop office
    /Applications/UTM.app/Contents/MacOS/utmctl stop london
    /Applications/UTM.app/Contents/MacOS/utmctl stop prod
    sleep 20

    /Applications/UTM.app/Contents/MacOS/utmctl start office
    /Applications/UTM.app/Contents/MacOS/utmctl start london
    /Applications/UTM.app/Contents/MacOS/utmctl start prod
    sleep 10

    echo "Running xyz.sh for subnet $SUBNET1.x"
    /Users/gsingh/Documents/delete.sh
    /Users/gsingh/Documents/addRoute.sh

    print_separator
fi
