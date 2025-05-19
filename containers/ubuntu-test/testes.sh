#!/bin/bash

clear
echo "=========================================="
echo "      TESTE DE INFRAESTRUTURA FASTFOOD    "
echo "=========================================="
echo ""

##########################
# 1. TESTE DE ROTEAMENTO #
##########################
echo "==== [1] Teste de rede e roteamento ===="
ip a | grep 'inet ' | grep eth0
echo ""
ip route
echo ""

echo "Ping para o roteador (192.168.2.254):"
ping -c 2 192.168.2.254 && echo "✅ Gateway respondendo"
echo ""

echo "Ping para a outra rede (192.168.1.254):"
ping -c 2 192.168.1.254 && echo "✅ Roteamento entre redes funcionando"
echo ""

##################
# 2. TESTE DE DNS #
##################
echo "==== [2] Teste de resolução DNS ===="
dig @192.168.1.10 fastfood.local +short
echo ""

echo "==== [3] Teste de resolução reversa DNS ===="
dig -x 192.168.1.10 @192.168.1.10 +short
echo ""

##################
# 4. TESTE HTTP   #
##################
echo "==== [4] Teste de acesso ao servidor Web ===="
curl -s http://192.168.1.80 | grep "Infraestrutura Fastfood" && echo "✅ Página web acessível"
echo ""

##################
# 5. TESTE LDAP   #
##################
echo "==== [5] Teste de consulta LDAP ===="
ldapsearch -x -H ldap://192.168.1.50 -b dc=fastfood,dc=local "(objectClass=*)" | grep "^dn:" && echo "✅ LDAP respondendo e retornando objetos"
echo ""

##################
# 6. TESTE FTP    #
##################
echo "==== [6] Teste de conexão FTP ===="
echo "open 192.168.1.70
user admin admin
bye" | ftp -nv | grep "230" && echo "✅ FTP login bem-sucedido"
echo ""

##################
# 7. TESTE SAMBA  #
##################
echo "==== [7] Teste de compartilhamento SAMBA ===="
smbclient //192.168.1.60/compartilhado -U admin%admin -c 'ls' && echo "✅ Compartilhamento Samba acessível"
echo ""

##################
# 8. TESTE FIREWALL #
##################
echo "==== [8] Teste de comunicação com firewall ===="
ping -c 2 192.168.1.5 && echo "✅ Firewall respondendo"
echo ""

echo "=========================================="
echo "        TESTES CONCLUÍDOS                 "
echo "=========================================="
