#!/bin/bash

echo "[LDAP] Iniciando slapd em segundo plano..."
slapd -h "ldap:///" &

sleep 3

if [ ! -f /var/lib/ldap/importado.flag ]; then
  echo "[LDAP] Importando base.ldif..."
  ldapadd -x -D "cn=admin,dc=fastfood,dc=local" -w admin -f /base.ldif
  touch /var/lib/ldap/importado.flag
else
  echo "[LDAP] Base já foi importada. Pulando..."
fi

echo "[LDAP] Rodando slapd no modo foreground..."
exec slapd -d 0
