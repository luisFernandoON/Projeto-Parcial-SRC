FROM ubuntu:20.04

# Evita prompts interativos
ENV DEBIAN_FRONTEND=noninteractive

# Instala ferramentas de rede e iptables
RUN apt update && apt install -y \
    iproute2 \
    iptables \
    iputils-ping \
 && apt clean

# Copia os scripts para o container
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY firewall.sh /usr/local/bin/firewall.sh

# Dá permissão de execução
RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/firewall.sh

# Define o entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
