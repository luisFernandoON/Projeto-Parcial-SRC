#!/bin/bash

echo
echo "[1] Verificando rota padrão:"
ip route | grep default
echo

echo "[2] Ping para o gateway do cliente (192.168.10.1):"
ping -c 3 192.168.10.1
echo

echo "[3] Teste DNS: fastfood.local @192.168.11.10"
dig fastfood.local @192.168.11.10
echo

echo "[4] Teste DNS reverso (FTP):"
dig -x 192.168.11.51 @192.168.11.10
echo

echo "[5] Teste LDAP (porta 389):"
nc -zv 192.168.11.60 389
echo

echo "[6] Teste FTP (porta 21):"
nc -zv 192.168.11.51 21
echo

echo "[7] Teste Webserver (porta 80):"
curl -I 192.168.11.50

