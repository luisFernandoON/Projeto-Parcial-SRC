# router/Dockerfile
FROM ubuntu:22.04

# Instala ferramentas básicas para roteamento
RUN apt update && apt install -y \
    iproute2 \
    iputils-ping \
    net-tools \
    iptables && apt clean

# Habilita IP forwarding no kernel (persistente via sysctl)
RUN echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf

# Copia o script de entrada e garante permissão
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Define o script de entrada, mantendo o container ativo
CMD ["/entrypoint.sh"]

