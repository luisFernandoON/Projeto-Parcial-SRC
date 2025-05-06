#!/bin/bash

# Política padrão
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Permitir localhost e pings
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -p icmp -j ACCEPT

# Permitir conexões estabelecidas
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

# DNS (TCP e UDP 53)
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p tcp --dport 53 -j ACCEPT

# DHCP (UDP 67/68)
iptables -A INPUT -p udp --sport 67:68 --dport 67:68 -j ACCEPT

# HTTP (porta 80)
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# FTP (porta 21 + passiva 30000-30009)
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A INPUT -p tcp --dport 30000:30009 -j ACCEPT

# LDAP (porta 389)
iptables -A INPUT -p tcp --dport 389 -j ACCEPT

# SAMBA
iptables -A INPUT -p tcp --dport 139 -j ACCEPT
iptables -A INPUT -p tcp --dport 445 -j ACCEPT
iptables -A INPUT -p udp --dport 137 -j ACCEPT
iptables -A INPUT -p udp --dport 138 -j ACCEPT

# Tráfego entre redes (clientes ↔ servidores)
iptables -A FORWARD -s 192.168.2.0/24 -d 192.168.1.0/24 -j ACCEPT
iptables -A FORWARD -s 192.168.1.0/24 -d 192.168.2.0/24 -j ACCEPT

# NAT para permitir saída da rede clientes
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

