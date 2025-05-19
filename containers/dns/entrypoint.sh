#!/bin/bash

# Verifica se as zonas estão corretas
named-checkconf || { echo "Erro no named.conf"; exit 1; }
named-checkzone fastfood.local /etc/bind/db.fastfood.local || { echo "Erro zona direta"; exit 1; }
named-checkzone 1.168.192.in-addr.arpa /etc/bind/db.1.168.192.in-addr.arpa || { echo "Erro zona reversa"; exit 1; }

# Inicia o bind em foreground
exec named -g -u bind
