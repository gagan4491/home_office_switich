#!/bin/bash

if ! ip link show ppp0 &>/dev/null; then
    echo "$(date): ppp0 not found, running run.sh" >> /var/log/ppp_monitor.log
    /root/run.sh
    echo "ppp0 reset ...."
fi

echo "ppp0 already present ...."
exit


