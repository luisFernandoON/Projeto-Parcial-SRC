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

# Copia o script de testes para dentro do container
COPY testes.sh /scripts/testes.sh
RUN chmod +x /scripts/testes.sh

CMD ["/bin/bash"]
