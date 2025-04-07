# 🚀 FASTFOOD - Infraestrutura de Rede com Docker

Projeto parcial da disciplina **Serviços de Redes de Computadores - 5º Período**. O objetivo é implementar uma infraestrutura de rede corporativa para uma rede de fast foods, utilizando containers Docker, redes isoladas e serviços essenciais de gestão.

---

## 📌 Objetivo

Implementar uma infraestrutura de rede corporativa, simulando um ambiente empresarial realista, com os seguintes serviços:

- DNS (Bind9)
- DHCP (ISC DHCP)
- FTP (vsftpd)
- Firewall (iptables)
- LDAP (OpenLDAP)
- SAMBA
- Web Server (Apache)
- Roteador (Ubuntu customizado)

---

## 🧱 Estrutura do Projeto


FASTFOOD/ 
  ├── dhcp/ 
  ├── dns/ 
  ├── docs/ 
  ├── firewall/ 
  ├── ftp/ 
  ├── ldap/ 
  ├── router/ 
  ├── samba/ 
  ├── scripts/ 
  ├── webserver/ 
  ├── docker-compose.yml 
  └── README.md


---

## ⚙️ Pré-requisitos

- Docker
- Docker Compose
- Git
- Linux (recomendado Ubuntu)
- Acesso root para executar comandos com permissão de rede

---

## 🧪 Como Executar

```bash
# 1. Clone o projeto

  - https://github.com/luisFernandoON/Projeto-Parcial-SRC.git

cd FASTFOOD

# 2. Suba a infraestrutura
docker compose up -d





🌐 Topologia da Rede
rede_servidores → 192.168.11.0/24

rede_clientes → 192.168.10.0/24

O container roteador faz a ponte entre ambas.







🧰 Serviços Configurados
🧭 DNS (Bind9)
IP: 192.168.11.10

Resolve domínios locais (ex: ftp.fastfood, www.fastfood)

Teste:

    -   dig @192.168.11.10 ftp.fastfood


🛰 DHCP (ISC DHCP)

IP: 192.168.10.10

Distribui IPs na rede 192.168.10.0/24

Teste:
    - docker exec -it ubuntu-test bash
      dhclient
      ip a

📁 FTP (vsftpd)
    - IP: 192.168.11.51

Portas expostas: 20, 21, 10090–10100

Teste:
    -ftp 192.168.11.51

🔥 Firewall (iptables)
IPs: 192.168.11.30 e 192.168.10.30

Regras configuradas via script iptables.sh no container

Teste:
    - iptables -L


🔐 LDAP (OpenLDAP)
IP: 192.168.11.60

Porta: 389 (LDAP), 636 (LDAPS)

Base DN: dc=fastfood,dc=local

Teste com ldapsearch:
    - ldapsearch -x -H ldap://192.168.11.60 -b dc=fastfood,dc=local

🖥 SAMBA
IP: 192.168.11.61

Compartilhamento da pasta pública /samba/public

Teste:
    - smbclient //192.168.11.61/public -U usuario


🌐 Web Server (Apache2)
IP: 192.168.11.50

Porta exposta: 8080

Acesse via navegador:
    - http://localhost:8080
    
🌉 Roteador
IPs:

192.168.11.1 (rede_servidores)

192.168.10.1 (rede_clientes)

Permite comunicação entre as sub-redes

Script customizado de NAT e roteamento

Teste:

    - ping 192.168.10.10


✅ Status dos Serviços
Serviço	        IP	            Status	      Testado
DNS	        192.168.11.10	      ✅          Ativo	✅
DHCP	    192.168.10.10	      ✅          Ativo	✅
FTP	        192.168.11.51	      ✅          Ativo	✅
Firewall	192.168.11.30/10.30	  ✅          Ativo	✅
LDAP	    192.168.11.60	      ✅          Ativo	✅
SAMBA	    192.168.11.61	      ✅          Ativo	✅
Webserver	192.168.11.50	      ✅          Ativo	✅
Roteador	192.168.11.1/10.1	  ✅          Ativo	✅



📄 Autores
Luis Fernando 👨‍💻
Ítalo         👨‍💻
Thiago Silva  👨‍💻


Professor orientador: Roitier Campos Gonçalves


📚 Licença
Este projeto está licenciado sob a licença MIT - consulte o arquivo LICENSE para mais detalhes.

🧠 Notas Finais
Este projeto é uma simulação educacional. Embora funcional, seu uso em produção exigiria configurações adicionais de segurança e performance.
