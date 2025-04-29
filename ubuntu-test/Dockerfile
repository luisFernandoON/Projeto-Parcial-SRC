FROM ubuntu:22.04

RUN apt update && apt install -y \
    iproute2 \
    iputils-ping \
    dnsutils \
    net-tools \
    nano \
    curl \
    bash \
    ldap-utils \
    smbclient \
    ftp \
    telnet \
    netcat-openbsd \
    isc-dhcp-client \
 && apt clean

COPY testes.sh /root/testes.sh
RUN chmod +x /root/testes.sh

CMD ["bash"]

