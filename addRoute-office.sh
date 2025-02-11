#!/bin/bash

sudo /sbin/route -n add -net 10.150.0.0/16 192.168.69.6
sudo /sbin/route -n add -net 10.77.77.0/24 192.168.69.6
sudo /sbin/route -n add -net 10.102.0.0/16 192.168.69.6
sudo /sbin/route -n add -net 10.100.100.0/24 192.168.69.6
sudo /sbin/route -n add -net 10.101.1.0/24 192.168.69.6
 
sudo /sbin/route -n add -net 10.110.110.0/24 192.168.69.7