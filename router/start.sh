#!/bin/sh
#
# start.sh – ativa o roteamento IPv4 e abre o FORWARD
#

set -eu

# 1) Ativa o IP forwarding no kernel
echo 1 > /proc/sys/net/ipv4/ip_forward

# 2) Garante que o FORWARD esteja liberado
iptables -P FORWARD ACCEPT

# 3) (Opcional) Se você quiser NAT, descomente estas linhas:
# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# 4) Mantém o container vivo
exec tail -f /dev/null

