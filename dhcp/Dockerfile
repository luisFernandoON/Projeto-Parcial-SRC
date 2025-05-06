FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y isc-dhcp-server && \
    rm -rf /var/lib/apt/lists/*

# Copia a configuração e o script de entrada
COPY dhcpd.conf /etc/dhcp/dhcpd.conf
COPY entrypoint.sh /entrypoint.sh

# Garante permissão de execução
RUN chmod +x /entrypoint.sh

# Define o entrypoint do container
ENTRYPOINT ["/entrypoint.sh"]

