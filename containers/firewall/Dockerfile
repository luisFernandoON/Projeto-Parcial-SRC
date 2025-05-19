FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y iptables iproute2 iputils-ping

COPY regras.sh /regras.sh
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh /regras.sh

ENTRYPOINT ["/entrypoint.sh"]
