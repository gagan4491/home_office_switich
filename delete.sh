#!/bin/bash

# Deleting route entries
# sudo route delete -net 10.150.0.0/16 192.168.69.3
# sudo route delete -net 10.77.77.0/24 192.168.69.3
# sudo route delete -net 10.102.0.0/16 192.168.69.3
#qa
sudo route -n delete -net 10.150.0.0/16 192.168.69.6
sudo route -n delete -net 10.77.77.0/24 192.168.69.6
sudo route -n delete -net 10.102.0.0/16 192.168.69.6
sudo route -n delete -net 10.100.100.0/24 192.168.69.6
sudo route -n delete -net 10.101.1.0/24 192.168.69.6


# sudo route delete -net 192.169.4.0/24 192.168.69.4
# sudo route delete -net 192.168.200.29 192.168.69.4
# sudo route delete -net 155.138.158.24 192.168.69.4

# int
sudo route -n delete -net 192.168.129.0/24 192.168.69.5

sudo route -n delete -net 192.168.4.0/24 192.168.69.5
sudo route -n delete -net 192.168.101.0/24 192.168.69.5
sudo route -n delete -net 192.168.100.0/24 192.168.69.5
sudo route -n delete -host 192.168.200.0/24 192.168.69.5
sudo route -n delete -host 155.138.158.24 192.168.69.5
sudo route -n delete -net 192.168.30.0/24 192.168.69.5

# prod
sudo route -n delete -net 10.110.110.0/24 192.168.69.7
sudo route -n delete -net 10.111.1.0/24 192.168.69.7




echo "Route entries have been deleted."
