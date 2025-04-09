FROM ubuntu:22.04

# Instala ferramentas básicas para roteamento
RUN apt update && apt install -y \
    iproute2 \
    iputils-ping \
    net-tools \
    iptables && \
    apt clean

# Habilita IP forwarding via sysctl (opcional — no host já está ativado)
RUN echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf

# Copia o script de entrada
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Define o script como ponto de entrada
CMD ["/entrypoint.sh"]

