#!/bin/bash


set -e

mkdir -p /var/lib/dhcp
touch /var/lib/dhcp/dhcpd.leases

exec /usr/sbin/dhcpd -f

service isc-dhcp-server start
tail -f /var/log/syslog
