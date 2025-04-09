#!/bin/bash

# Cria diretório compartilhado
mkdir -p /samba/public
chmod -R 0777 /samba/public

# Cria usuário local (sem diretório home, sem shell)
useradd -M -s /usr/sbin/nologin fastuser

# Adiciona ao samba com senha
(echo "senha123"; echo "senha123") | smbpasswd -a -s fastuser

# Inicia o samba como serviço no foreground
exec /usr/sbin/smbd -F --no-process-group
