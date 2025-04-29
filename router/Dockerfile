FROM ubuntu:22.04

RUN apt update && apt install -y iproute2 iputils-ping net-tools iptables

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]

