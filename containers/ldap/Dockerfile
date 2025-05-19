FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y debconf-utils

# Pré-configura a senha do admin do slapd
RUN echo "slapd slapd/no_configuration boolean false" | debconf-set-selections && \
    echo "slapd slapd/internal/adminpw password admin" | debconf-set-selections && \
    echo "slapd slapd/internal/generated_adminpw password admin" | debconf-set-selections && \
    echo "slapd slapd/password1 password admin" | debconf-set-selections && \
    echo "slapd slapd/password2 password admin" | debconf-set-selections && \
    echo "slapd slapd/domain string fastfood.local" | debconf-set-selections && \
    echo "slapd shared/organization string Fastfood Corp" | debconf-set-selections && \
    echo "slapd slapd/backend select MDB" | debconf-set-selections && \
    echo "slapd slapd/purge_database boolean true" | debconf-set-selections && \
    echo "slapd slapd/move_old_database boolean true" | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive apt install -y slapd ldap-utils

COPY entrypoint.sh /entrypoint.sh
COPY base.ldif /base.ldif

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
