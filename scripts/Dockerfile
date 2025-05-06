FROM ubuntu:20.04

# Evita prompts durante instalação
ENV DEBIAN_FRONTEND=noninteractive

# Atualiza e instala ferramentas de rede
RUN apt-get update && apt-get install -y \
    iproute2 \
    iputils-ping \
    dnsutils \
    curl \
    netcat \
    && apt-get clean

# Copia os scripts
COPY testes.sh /scripts/testes.sh
COPY entrypoint.sh /entrypoint.sh

# Permissões
RUN chmod +x /scripts/testes.sh /entrypoint.sh

# Roda o entrypoint que chama o testes.sh
ENTRYPOINT ["/entrypoint.sh"]

