#!/bin/bash
set -e

# Ativa o IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Aguarda 5 segundos para garantir que a rede foi criada
sleep 5



# Conecta o container roteador na segunda rede
docker network connect projeto-parcial-src_rede_clientes roteador || true

# Configura o IP na interface extra
# eth1 deve ser a interface da rede_clientes
sleep 2
ip addr add 172.29.0.253/24 dev eth1 || true

# Define regras de roteamento e NAT
iptables -P FORWARD ACCEPT
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

# Mantém o container rodando
exec tail -f /dev/null

