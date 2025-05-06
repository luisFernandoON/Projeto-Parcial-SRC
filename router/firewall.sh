#!/bin/bash

# Limpa regras antigas
iptables -F
iptables -t nat -F

# Políticas padrão
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Loopback e ICMP (ping)
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT

# Conexões estabelecidas
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

# DNS (BIND9 no 192.168.1.10)
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -A FORWARD -s 192.168.2.0/24 -d 192.168.1.10 -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -s 192.168.2.0/24 -d 192.168.1.10 -p tcp --dport 53 -j ACCEPT

# DHCP (UDP 67/68)
iptables -A INPUT -p udp --sport 67:68 --dport 67:68 -j ACCEPT

# HTTP (Web server 192.168.1.50)
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -s 192.168.2.0/24 -d 192.168.1.50 -p tcp --dport 80 -j ACCEPT

# FTP (192.168.1.20)
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport 30000:30009 -j ACCEPT
iptables -A FORWARD -s 192.168.2.0/24 -d 192.168.1.20 -p tcp --dport 21 -j ACCEPT
iptables -A FORWARD -s 192.168.2.0/24 -d 192.168.1.20 -p tcp --dport 30000:30009 -j ACCEPT

# LDAP (192.168.1.30)
iptables -A INPUT -p tcp --dport 389 -j ACCEPT
iptables -A FORWARD -s 192.168.2.0/24 -d 192.168.1.30 -p tcp --dport 389 -j ACCEPT

# SAMBA (192.168.1.40)
iptables -A INPUT -p tcp --dport 139 -j ACCEPT
iptables -A INPUT -p tcp --dport 445 -j ACCEPT
iptables -A INPUT -p udp --dport 137 -j ACCEPT
iptables -A INPUT -p udp --dport 138 -j ACCEPT
iptables -A FORWARD -s 192.168.2.0/24 -d 192.168.1.40 -j ACCEPT

# NAT — saída pela interface da rede do servidor
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

