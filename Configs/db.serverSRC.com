$TTL 86400
@       IN      SOA     ns1.serverSRC.com. admin.serverSRC.com. (
                        2024042001 ; Serial
                        3600       ; Refresh
                        1800       ; Retry
                        604800     ; Expire
                        86400 )    ; Minimum TTL

; Servidores de Nome
@       IN      NS      ns1.serverSRC.com.
ns1     IN      A       192.168.1.2