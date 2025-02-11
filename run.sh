#!/bin/bash

# Print "Hello" to the terminal

echo "Hello running for login"

echo "nameserver 8.8.8.8" > /etc/resolv.conf


# Start a detached screen session named 'vpn_session' and run './login.sh' within it
screen -dmS vpn_session ./login.sh


sleep 2
echo "Hello running for masquerade"

# Execute the script 'adaddMasqueradeFortiClientVPN.sh' (ensure this is the correct path)
/bin/bash /root/masq.sh

# Optional: a brief pause to ensure the above commands have time to execute before attempting to reattach
sleep 2
echo " done"
# Reattach to the 'vpn_session' screen session
# If this script is run in a terminal, this command will attach to the screen session
# If you don't want to attach immediately, you can remove this line
#screen -r vpn_session
