FROM osixia/openldap:1.5.0

ENV LDAP_ORGANISATION="FastFood Ltda" \
    LDAP_DOMAIN="fastfod.com" \
    LDAP_ADMIN_PASSWORD="admin123"

# Copia o LDIF para a pasta de importação automática
COPY base.ldif /container/service/slapd/assets/config/bootstrap/ldif/50-base.ldif

EXPOSE 389 636
