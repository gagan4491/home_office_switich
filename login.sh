#!/usr/bin/expect

# Set timeout to prevent hanging
set timeout 20

# Launch the command that requires interaction
####change url for the office
#spawn openfortivpn london.alertdriving.com:21443 --username=gsingh --trusted-cert 9a9be1f7b2dba9f4a19da0c803bf351de7dffc0e4bc09f895099db367091431f
##change the url for prod
#spawn openfortivpn london.alertdriving.com:21443 --username=gsingh --trusted-cert 9a9be1f7b2dba9f4a19da0c803bf351de7dffc0e4bc09f895099db367091431f ##change the url for prod
spawn openfortivpn london.alertdriving.com:21443 --username=gsingh --trusted-cert 9a9be1f7b2dba9f4a19da0c803bf351de7dffc0e4bc09f895099db367091431f




# Wait for the password prompt and respond
expect "VPN account password:"
send "Abc@Abc3\r"

# Respond to the follow-up prompt

# Hand over control to the user (if needed)
interact
