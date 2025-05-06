#!/bin/bash

# Ativa o roteamento IPv4
echo 1 > /proc/sys/net/ipv4/ip_forward

# Aplica as regras de firewall
/usr/local/bin/firewall.sh

# Mantém o container ativo
tail -f /dev/null

