#!/bin/bash

set -e

# Define a rota padrão
ip route replace default via 192.168.2.254 || true

# Define o DNS manualmente
echo "nameserver 192.168.1.10" > /etc/resolv.conf

# Mantém o container ativo
tail -f /dev/null
