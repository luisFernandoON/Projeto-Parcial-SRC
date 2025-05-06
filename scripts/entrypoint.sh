#!/bin/bash

# Corrige a rota padrão
ip route replace default via 192.168.2.254

# Define DNS
echo "nameserver 192.168.1.10" > /etc/resolv.conf

# Cria diretório de log se necessário
mkdir -p /resultados


echo "Aguardando serviços subirem..."
sleep 5

# Executa os testes com argumentos (ex: --resumido) e salva em log
/scripts/testes.sh "$@" | tee /resultados/testes.log

