#!/bin/bash

# Ativa o roteamento de pacotes IPv4
echo 1 > /proc/sys/net/ipv4/ip_forward

# Habilita NAT para permitir tráfego entre redes
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Mantém o container ativo
tail -f /dev/null
