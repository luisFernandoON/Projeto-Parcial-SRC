#!/bin/bash

green="\033[1;32m"
red="\033[1;31m"
reset="\033[0m"
erros=0
modo="$1"

if [[ "$modo" == "--resumido" ]]; then
    resumo=true
else
    resumo=false
fi

if [ "$resumo" = false ]; then echo -e "\n===== [TESTE 1] Verificando Rota Padrão ====="; fi
ip route | grep default &>/dev/null
if [ $? -eq 0 ]; then
    echo -e "${green}✅ Rota padrão encontrada${reset}"
else
    echo -e "${red}❌ Sem rota padrão${reset}"
    ((erros++))
fi

if [ "$resumo" = false ]; then echo -e "\n===== [TESTE 2] Ping para Gateway (192.168.2.254) ====="; fi
ping -c 3 -W 1 192.168.2.254 &>/dev/null
if [ $? -eq 0 ]; then
    echo -e "${green}✅ Gateway respondeu${reset}"
else
    echo -e "${red}❌ Falha no ping ao gateway${reset}"
    ((erros++))
fi

if [ "$resumo" = false ]; then echo -e "\n===== [TESTE 3] DNS direto - ftp.fastfood.local ====="; fi
dig +time=2 +tries=1 @192.168.1.10 ftp.fastfood.local +short
if [ $? -eq 0 ]; then
    echo -e "${green}✅ DNS direto funcional${reset}"
else
    echo -e "${red}❌ DNS direto falhou${reset}"
    ((erros++))
fi

if [ "$resumo" = false ]; then echo -e "\n===== [TESTE 4] DNS reverso - 192.168.1.50 ====="; fi
dig +time=2 +tries=1 -x 192.168.1.50 @192.168.1.10 +short
if [ $? -eq 0 ]; then
    echo -e "${green}✅ DNS reverso funcional${reset}"
else
    echo -e "${red}❌ DNS reverso falhou${reset}"
    ((erros++))
fi

if [ "$resumo" = false ]; then echo -e "\n===== [TESTE 5] LDAP na porta 389 ====="; fi
nc -zvw2 192.168.1.30 389 &>/dev/null
if [ $? -eq 0 ]; then
    echo -e "${green}✅ LDAP porta 389 disponível${reset}"
else
    echo -e "${red}❌ LDAP porta 389 não responde${reset}"
    ((erros++))
fi

if [ "$resumo" = false ]; then echo -e "\n===== [TESTE 6] FTP na porta 21 ====="; fi
nc -zvw2 192.168.1.20 21 &>/dev/null
if [ $? -eq 0 ]; then
    echo -e "${green}✅ FTP porta 21 disponível${reset}"
else
    echo -e "${red}❌ FTP porta 21 não responde${reset}"
    ((erros++))
fi

if [ "$resumo" = false ]; then echo -e "\n===== [TESTE 7] Webserver (porta 80) ====="; fi
curl -sI --connect-timeout 3 http://192.168.1.50 | grep "200 OK" &>/dev/null
if [ $? -eq 0 ]; then
    echo -e "${green}✅ Webserver respondeu com 200 OK${reset}"
else
    echo -e "${red}❌ Webserver inativo ou com erro${reset}"
    ((erros++))
fi

echo -e "\n===== [RESULTADO FINAL] ====="
if [ $erros -eq 0 ]; then
    echo -e "${green}✅ Todos os testes passaram com sucesso!${reset}"
    exit 0
else
    echo -e "${red}❌ Total de falhas: $erros${reset}"
    exit $erros
fi

