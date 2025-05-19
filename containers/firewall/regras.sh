#!/bin/bash

# Políticas padrão: tudo bloqueado
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Permite loopback (localhost)
iptables -A INPUT -i lo -j ACCEPT

# Permite conexões estabelecidas e relacionadas
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Permite ping
iptables -A INPUT -p icmp -j ACCEPT

# Libera portas específicas
iptables -A INPUT -p tcp --dport 22 -j ACCEPT   # SSH
iptables -A INPUT -p tcp --dport 80 -j ACCEPT   # HTTP
iptables -A INPUT -p tcp --dport 443 -j ACCEPT  # HTTPS
iptables -A INPUT -p tcp --dport 389 -j ACCEPT  # LDAP
iptables -A INPUT -p udp --dport 53 -j ACCEPT   # DNS UDP
iptables -A INPUT -p tcp --dport 53 -j ACCEPT   # DNS TCP
iptables -A INPUT -p tcp --dport 21 -j ACCEPT   # FTP (control)
iptables -A INPUT -p tcp --dport 20 -j ACCEPT   # FTP (data)
iptables -A INPUT -p tcp --dport 10090:10100 -j ACCEPT  # FTP passive range (opcional)
# Libera tráfego entre rede de clientes e rede de servidores
iptables -A FORWARD -i eth0 -o eth0 -s 192.168.2.0/24 -d 192.168.1.0/24 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth0 -s 192.168.1.0/24 -d 192.168.2.0/24 -j ACCEPT
