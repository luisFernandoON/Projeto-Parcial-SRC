FROM osixia/openldap

COPY base.ldif /container/service/slapd/assets/config/bootstrap/ldif/50-bootstrap.ldif
COPY entrypoint.sh /container-entrypoint.sh

RUN chmod +x /container-entrypoint.sh

ENTRYPOINT ["/container-entrypoint.sh"]