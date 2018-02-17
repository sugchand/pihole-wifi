#!/bin/bash

# The IP for the router you wish to ping.
GW_IP=192.168.8.1

# Only send two pings, sending output to /dev/null
ping -c2 ${GW_IP} > /dev/null

# If the return code from ping ($?) is not 0 (meaning there was an error)
if [ $? != 0 ]
then
    # Restart the wireless interface
    ifdown --force wlan0
    ifup wlan0
fi

