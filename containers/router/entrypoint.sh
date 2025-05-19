#!/bin/bash

echo "[ROTEADOR] Ativando roteamento de IP..."
echo 1 > /proc/sys/net/ipv4/ip_forward

echo "[ROTEADOR] Limpando regras anteriores..."
iptables -F
iptables -t nat -F

echo "[ROTEADOR] Definindo política padrão como ACCEPT..."
iptables -P FORWARD ACCEPT

echo "[ROTEADOR] Permissões explícitas de tráfego entre as redes..."
iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

echo "[ROTEADOR] Aplicando MASQUERADE (NAT) nas duas interfaces..."
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

echo "[ROTEADOR] Regras aplicadas. Pronto para roteamento total."
tail -f /dev/null
