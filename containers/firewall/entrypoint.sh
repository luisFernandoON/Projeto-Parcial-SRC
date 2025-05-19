#!/bin/bash

echo "[FIREWALL] Limpando regras antigas..."
iptables -F

echo "[FIREWALL] Aplicando regras..."
/regras.sh

if [ $? -ne 0 ]; then
  echo "[FIREWALL] Falha ao aplicar regras."
  exit 1
fi

echo "[FIREWALL] Regras aplicadas com sucesso. Monitorando..."
tail -f /dev/null
