#!/bin/bash

echo "[1] Validando configuração do DHCP..."
dhcpd -t -cf /etc/dhcp/dhcpd.conf

echo "[2] Iniciando servidor DHCP..."
mkdir -p /var/lib/dhcp
touch /var/lib/dhcp/dhcpd.leases

exec dhcpd -f -cf /etc/dhcp/dhcpd.conf
