FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y bind9 dnsutils

COPY named.conf.options /etc/bind/named.conf.options
COPY named.conf.local /etc/bind/named.conf.local
COPY db.fastfood.local /etc/bind/db.fastfood.local
COPY db.1.168.192.in-addr.arpa /etc/bind/db.1.168.192.in-addr.arpa

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
RUN apt update && apt install -y iputils-ping


ENTRYPOINT ["/entrypoint.sh"]
