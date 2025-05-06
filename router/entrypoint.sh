#!/bin/bash

# Ativa o roteamento de pacotes IPv4
echo 1 > /proc/sys/net/ipv4/ip_forward

# Executa as regras de firewall
bash /usr/local/bin/firewall.sh

# Mantém o container ativo
tail -f /dev/null
