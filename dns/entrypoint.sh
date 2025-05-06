#!/bin/bash

# Ativa o encaminhamento (só por segurança)
echo 1 > /proc/sys/net/ipv4/ip_forward

# Libera DNS UDP e TCP de todas as redes
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT

# Libera tráfego já estabelecido
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Mantém o BIND rodando em primeiro plano
named -g -u bind

