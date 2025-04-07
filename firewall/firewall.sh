#!/bin/bash

# Política padrão segura
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Libera localhost
iptables -A INPUT -i lo -j ACCEPT

# Libera ping
iptables -A INPUT -p icmp -j ACCEPT

# Libera conexões já estabelecidas
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

# Libera DNS (UDP e TCP 53)
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT

# Libera DHCP (comunicação cliente-servidor)
iptables -A INPUT -p udp --sport 67:68 --dport 67:68 -j ACCEPT

# Libera HTTP (porta 80)
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Loga o que for negado
iptables -A INPUT -j LOG --log-level 4 --log-prefix "FIREWALL INPUT DROP: "

# Libera tráfego entre clientes e servidores (bidirecional)
iptables -A FORWARD -s 192.168.10.0/24 -d 192.168.11.0/24 -j ACCEPT
iptables -A FORWARD -s 192.168.11.0/24 -d 192.168.10.0/24 -j ACCEPT

# Libera portas usadas pelo Samba
iptables -A FORWARD -p tcp --dport 139 -j ACCEPT
iptables -A FORWARD -p tcp --dport 445 -j ACCEPT
iptables -A FORWARD -p udp --dport 137 -j ACCEPT
iptables -A FORWARD -p udp --dport 138 -j ACCEPT
