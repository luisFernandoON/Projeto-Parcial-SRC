#!/bin/bash

# Ativa o IP forwarding dentro do container (precisa de modo privileged)
echo 1 > /proc/sys/net/ipv4/ip_forward

# Apaga regras antigas (boa prática em testes)
iptables -t nat -F

# Aplica regra de NAT: clientes (eth0) saem para os servidores (eth1)
iptables -t nat -A POSTROUTING -s 192.168.10.0/24 -o eth1 -j MASQUERADE

# Mantém o container ativo
sleep infinity

