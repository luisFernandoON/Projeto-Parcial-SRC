#!/bin/bash
# scripts/testes.sh

echo "===== [TESTE 1] Verificando Rota Padrão ====="
ip route | grep default || echo "❌ Sem rota padrão"
echo

echo "===== [TESTE 2] Ping para Gateway ====="
ping -c 3 172.29.0.253 || echo "❌ Falha no ping ao gateway"
echo

echo "===== [TESTE 3] Teste DNS direto ====="
dig ftp.fastfood.local @172.28.0.10 || echo "❌ DNS direto falhou"
echo

echo "===== [TESTE 4] Teste DNS reverso ====="
dig -x 172.28.0.51 @172.28.0.10 || echo "❌ DNS reverso falhou"
echo

echo "===== [TESTE 5] Verificando Webserver ====="
curl -I http://172.28.0.50 || echo "❌ Webserver inativo"
echo

echo "===== [TESTE 6] Testando FTP (porta 21) ====="
nc -zv 172.28.0.51 21 || echo "❌ FTP porta 21 não responde"
echo

echo "===== [TESTE 7] Testando LDAP ====="
nc -zv 172.28.0.60 389 || echo "❌ LDAP porta 389 não responde"
echo

echo "===== [TESTE 8] Testando SAMBA ====="
nc -zv 172.28.0.61 445 || echo "❌ SAMBA porta 445 não responde"
echo

echo "===== [FIM DOS TESTES] ====="
