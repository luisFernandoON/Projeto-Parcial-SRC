#!/bin/bash

# Executa o script de firewall
/usr/local/bin/firewall.sh

# Mantém o container vivo
tail -f /dev/null
