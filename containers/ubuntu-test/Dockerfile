FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    iputils-ping \
    dnsutils \
    curl \
    net-tools \
    ldap-utils \
    smbclient \
    ftp \
    iproute2

COPY entrypoint.sh /entrypoint.sh
COPY testes.sh /root/testes.sh

RUN chmod +x /entrypoint.sh /root/testes.sh

ENTRYPOINT ["/entrypoint.sh"]
