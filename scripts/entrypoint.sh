#!/bin/bash

# Corrige a rota padrão
ip route replace default via 192.168.2.254

# Define DNS
echo "nameserver 192.168.1.10" > /etc/resolv.conf

# Cria diretório de log se não existir
mkdir -p /resultados

# Executa os testes com argumentos (ex: --resumido) e salva o log
/scripts/testes.sh "$@" | tee /resultados/testes.log

# Mantém o container ativo para evitar reinício
exec tail -f /dev/null

