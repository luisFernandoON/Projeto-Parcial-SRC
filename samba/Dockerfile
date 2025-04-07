FROM dperson/samba

# Copia os arquivos de configuração
COPY smb.conf /etc/samba/smb.conf
COPY setup.sh /setup.sh

# Torna o script executável
RUN chmod +x /setup.sh

# Executa o script no start
CMD ["/setup.sh"]
