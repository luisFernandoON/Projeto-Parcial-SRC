FROM ubuntu:20.04

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install -y iproute2 iptables iputils-ping

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
COPY firewall.sh /usr/local/bin/firewall.sh

RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/firewall.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

