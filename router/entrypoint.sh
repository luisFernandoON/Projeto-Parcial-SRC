#!/bin/sh
set -eu

# Ativa o IP forwarding imediatamente
echo 1 > /proc/sys/net/ipv4/ip_forward

# Define política de FORWARD para ACCEPT
iptables -P FORWARD ACCEPT

# Para habilitar NAT, descomente a linha abaixo e ajuste a interface de saída
# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Mantém o container rodando
exec tail -f /dev/null

