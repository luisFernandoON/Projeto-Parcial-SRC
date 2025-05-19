#!/bin/bash

echo "[APACHE] Iniciando Apache HTTP Server..."
exec apachectl -D FOREGROUND
