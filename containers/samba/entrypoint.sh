#!/bin/bash

echo "[SAMBA] Verificando e criando admin..."

if ! pdbedit -L | grep -q "^admin:"; then
  useradd -M admin
  (echo "admin"; echo "admin") | smbpasswd -a admin
fi

echo "[SAMBA] Iniciando o serviço smbd..."
exec /usr/sbin/smbd -F --no-process-group
