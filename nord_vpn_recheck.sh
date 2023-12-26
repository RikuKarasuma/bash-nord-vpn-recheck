#!/bin/bash

vpn_status=$(nordvpn status | grep Status: | awk -F ':' '{print $2}');

echo "Current VPN Status:" $vpn_status;

while [[ $vpn_status == *"Disconnected"* ]]; do
        nordvpn connect amsterdam;
        vpn_status=$(nordvpn status | grep Status: | awk -F ':' '{print $2}');
        echo "Current VPN Status:" $vpn_status;
        if [[ $vpn_status == *"Disconnected"* ]]; then
                echo "Attempting reconnect...";
                sleep 5;
        fi;
done;
