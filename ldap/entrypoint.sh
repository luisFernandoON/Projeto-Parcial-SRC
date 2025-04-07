#!/bin/bash

echo "Aguardando o OpenLDAP ficar disponível..."

# Loop até o servidor responder
while ! ldapsearch -x -H ldap://localhost -b "" > /dev/null 2>&1; do
    echo "LDAP ainda não disponível, aguardando..."
    sleep 2
done

echo "LDAP disponível! Verificando se a base já existe..."

ldapsearch -x -H ldap://localhost -b dc=fastfod,dc=com > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Base DN não encontrada, importando estrutura base..."
    ldapadd -x -D "cn=admin,dc=fastfod,dc=com" -w admin123 -f /container/ldif/base.ldif
else
    echo "Base DN já existente."
fi

# Mantém o container ativo
tail -f /dev/null
