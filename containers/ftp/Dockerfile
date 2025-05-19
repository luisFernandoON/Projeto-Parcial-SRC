FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y vsftpd openssl

COPY vsftpd.conf /etc/vsftpd.conf
COPY cert.pem /etc/ssl/certs/vsftpd.pem
COPY key.pem /etc/ssl/private/vsftpd.key
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
