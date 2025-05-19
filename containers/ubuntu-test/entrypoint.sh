#!/bin/bash

echo "[UBUNTU-TEST] Corrigindo rota padrão para 192.168.2.254..."
ip route del default
ip route add default via 192.168.2.254

echo "[UBUNTU-TEST] Iniciando testes automáticos..."
bash /root/testes.sh

tail -f /dev/null
