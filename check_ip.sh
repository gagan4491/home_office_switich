#!/bin/bash
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Now you can use commands like `ifconfig` and `route` directly
echo "Checking route..."
route -n

echo "Checking network configuration..."
ifconfig ifconfig | grep  'bridge'

echo "  "


sleep 10 ;

# Get the primary IP address
IP=$(/sbin/ifconfig en0 | grep 'inet ' | awk '{print $2}')

# Define subnet prefixes
SUBNET1="192.168.101."
SUBNET2="192.168.11."

# Check the IP and run the appropriate script
if [[ "$IP" == "$SUBNET1"* ]]; then
    echo "Running abc.sh for subnet $SUBNET1.x"
    /Applications/UTM.app/Contents/MacOS/utmctl stop office
    /Applications/UTM.app/Contents/MacOS/utmctl stop london
    /Applications/UTM.app/Contents/MacOS/utmctl stop prod

    sleep 20;
    /Applications/UTM.app/Contents/MacOS/utmctl start london
    /Applications/UTM.app/Contents/MacOS/utmctl start prod
    sleep 10;
    /Users/gsingh/Documents/delete.sh
    /Users/gsingh/Documents/addRoute-office.sh

elif [[ "$IP" == "$SUBNET2"* ]]; then
    /Applications/UTM.app/Contents/MacOS/utmctl stop office
    /Applications/UTM.app/Contents/MacOS/utmctl stop london
    /Applications/UTM.app/Contents/MacOS/utmctl stop prod
    sleep 20 ;

    /Applications/UTM.app/Contents/MacOS/utmctl start office
    /Applications/UTM.app/Contents/MacOS/utmctl start london
    /Applications/UTM.app/Contents/MacOS/utmctl start prod
    sleep 10 ;
    echo "Running xyz.sh for subnet $SUBNET1.x"
    /Users/gsingh/Documents/delete.sh
    /Users/gsingh/Documents/addRoute.sh
else
    echo "IP address $IP does not match specified subnets."
fi
