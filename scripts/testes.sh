#!/bin/bash
# scripts/testes.sh

green="\033[1;32m"
red="\033[1;31m"
reset="\033[0m"
erros=0

echo -e "\n===== [TESTE 1] Verificando Rota Padrão ====="
ip route | grep default >/dev/null
if [ $? -eq 0 ]; then
    echo -e "${green}✅ Rota padrão encontrada${reset}"
else
    echo -e "${red}❌ Sem rota padrão${reset}"
    ((erros++))
fi
echo

echo "===== [TESTE 2] Ping para Gateway ====="
ping -c 3 192.168.2.254 >/dev/null
if [ $? -eq 0 ]; then
    echo -e "${green}✅ Gateway respondeu${reset}"
else
    echo -e "${red}❌ Falha no ping ao gateway${reset}"
    ((erros++))
fi
echo

echo "===== [TESTE 3] Teste DNS direto ====="
dig ftp.fastfood.local @192.168.1.10 +short
if [ $? -eq 0 ]; then
    echo -e "${green}✅ DNS direto funcional${reset}"
else
    echo -e "${red}❌ DNS direto falhou${reset}"
    ((erros++))
fi
echo

echo "===== [TESTE 4] Teste DNS reverso ====="
dig -x 192.168.1.50 @192.168.1.10 +short
if [ $? -eq 0 ]; then
    echo -e "${green}✅ DNS reverso funcional${reset}"
else
    echo -e "${red}❌ DNS reverso falhou${reset}"
    ((erros++))
fi
echo

echo "===== [TESTE 5] Verificando Webserver ====="
curl -sI http://192.168.1.50 | grep "200 OK" >/dev/null
if [ $? -eq 0 ]; then
    echo -e "${green}✅ Webserver respondeu com 200 OK${reset}"
else
    echo -e "${red}❌ Webserver inativo ou com erro${reset}"
    ((erros++))
fi
echo

echo "===== [TESTE 6] Testando FTP (porta 21) ====="
nc -zvw2 192.168.1.20 21 >/dev/null
if [ $? -eq 0 ]; then
    echo -e "${green}✅ FTP porta 21 disponível${reset}"
else
    echo -e "${red}❌ FTP porta 21 não responde${reset}"
    ((erros++))
fi
echo

echo "===== [TESTE 7] Testando LDAP ====="
nc -zvw2 192.168.1.30 389 >/dev/null
if [ $? -eq 0 ]; then
    echo -e "${green}✅ LDAP porta 389 disponível${reset}"
else
    echo -e "${red}❌ LDAP porta 389 não responde${reset}"
    ((erros++))
fi
echo

echo "===== [TESTE 8] Testando SAMBA ====="
nc -zvw2 192.168.1.40 445 >/dev/null
if [ $? -eq 0 ]; then
    echo -e "${green}✅ SAMBA porta 445 disponível${reset}"
else
    echo -e "${red}❌ SAMBA porta 445 não responde${reset}"
    ((erros++))
fi
echo

echo -e "===== [RESULTADO FINAL] ====="
if [ $erros -eq 0 ]; then
    echo -e "${green}✅ Todos os testes passaram com sucesso!${reset}"
else
    echo -e "${red}❌ Total de falhas: $erros${reset}"
fi

