cat << 'EOF' > dhcp/entrypoint.sh
#!/bin/bash
set -e

mkdir -p /var/lib/dhcp
touch /var/lib/dhcp/dhcpd.leases

# Corrige rota padrão para o roteador
ip route replace default via 192.168.2.254

# Inicia o servidor DHCP em modo foreground com log no stdout
/usr/sbin/dhcpd -f -d &

# Mostra os logs em tempo real
tail -f /var/log/syslog
EOF

chmod +x dhcp/entrypoint.sh

