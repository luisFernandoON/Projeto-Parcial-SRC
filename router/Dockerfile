FROM ubuntu:20.04

RUN apt-get update && apt-get install -y iproute2 iputils-ping net-tools iptables

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]

