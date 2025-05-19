FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y bind9 dnsutils iputils-ping && \
    mkdir -p /run/named /var/cache/bind && \
    chown -R bind:bind /etc/bind /var/cache/bind /run/named

COPY named.conf.options /etc/bind/named.conf.options
COPY named.conf.local /etc/bind/named.conf.local
COPY db.fastfood.local /etc/bind/db.fastfood.local
COPY db.1.168.192.in-addr.arpa /etc/bind/db.1.168.192.in-addr.arpa
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
