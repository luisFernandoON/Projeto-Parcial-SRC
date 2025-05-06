#!/bin/bash

echo 1 > /proc/sys/net/ipv4/ip_forward

# Executa as regras do firewall (separado para facilitar)
bash /usr/local/bin/firewall.sh

# Mantém o container ativo
tail -f /dev/null

