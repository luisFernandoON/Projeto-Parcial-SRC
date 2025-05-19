#!/bin/bash

echo "[FTP] Garantindo secure_chroot_dir..."
mkdir -p /var/run/vsftpd/empty

echo "[FTP] Criando usuário admin se necessário..."
if ! id "admin" &>/dev/null; then
  useradd -m -s /bin/bash admin
  echo "admin:admin" | chpasswd
fi

echo "[FTP] Iniciando serviço vsftpd..."
exec /usr/sbin/vsftpd /etc/vsftpd.conf
