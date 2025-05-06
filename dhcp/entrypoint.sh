#!/bin/bash

set -e

# Cria arquivos necessários
mkdir -p /var/lib/dhcp
touch /var/lib/dhcp/dhcpd.leases

# Inicia o servidor DHCP na interface correta
exec /usr/sbin/dhcpd -f -cf /etc/dhcp/dhcpd.conf eth0

