#!/bin/bash
set -e

mkdir -p /samba/public

# Cria usuário do sistema
useradd -M fastuser

# Cria usuário no Samba com senha "senha"
(echo "senha"; echo "senha") | smbpasswd -s -a fastuser

# Permissões
chown -R fastuser:fastuser /samba/public

# Inicia serviços
smbd -F
