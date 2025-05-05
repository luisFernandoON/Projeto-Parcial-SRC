#!/bin/bash

apt-get update
apt-get install -y isc-dhcp-server

cp /scripts/dhcpd.conf /etc/dhcp/dhcpd.conf

dhcpd -f -d --no-pid
