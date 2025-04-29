# 🚀 FASTFOOD - Infraestrutura de Rede com Docker

Projeto parcial da disciplina **Serviços de Redes de Computadores - 5º Período** – IF Goiano.  
Este projeto simula a infraestrutura de TI de uma rede de fast foods, implementada inteiramente com **Docker**, separando serviços essenciais em **sub-redes isoladas** com um container roteador atuando como gateway.

---

## 📌 Objetivo

Implementar uma infraestrutura de rede corporativa com os seguintes serviços, todos em containers Docker:

- DNS (Bind9)
- DHCP (ISC DHCP)
- FTP (vsftpd)
- Firewall (iptables)
- LDAP (OpenLDAP)
- SAMBA
- Web Server (Apache)
- Roteador (Ubuntu com iptables + NAT)

---

## 🧱 Estrutura de Diretórios

FASTFOOD/ 
 ├── containers/│ 
 ├── dhcp/ │  
 ├── dns/ │ 
 ├── firewall/ │ 
 ├── ftp/ │ 
 ├── ldap/ │ 
 ├── router/ │ 
 ├── samba/ │ 
 ├── webserver/ 
 ├── scripts/ │ 
     └── testes.sh 
 ├── docker-compose.yml 
 └── README.md


 
---

## ⚙️ Pré-requisitos

- Linux (recomendado: Ubuntu 22.04+)
- Docker
- Docker Compose
- Git
- Acesso root ou permissão `sudo` para comandos de rede

---

## 🚀 Como Executar

```bash
# 1. Clone o projeto
git clone https://github.com/luisFernandoON/Projeto-Parcial-SRC.git
cd Projeto-Parcial-SRC

# 2. Suba toda a infraestrutura
sudo docker compose up -d --build

# 3. (Opcional) Execute testes automatizados
sudo docker exec -it ubuntu-test /root/testes.sh
🌐 Topologia da Rede
Rede	Sub-rede	Serviços
rede_servidores	172.28.0.0/24	DNS, FTP, Web, LDAP, Samba, etc
rede_clientes	172.29.0.0/24	Cliente com DHCP, testes

O container roteador conecta ambas as redes, atuando como gateway com NAT e regras de firewall via iptables.

🧰 Serviços Configurados e Testes
🧭 DNS (Bind9)

    IP: 172.28.0.10

    Função: Resolve nomes locais como ftp.fastfood.local

  dig ftp.fastfood.local @172.28.0.10
  dig -x 172.28.0.51 @172.28.0.10


🛰 DHCP (ISC DHCP)

    IP: 172.29.0.10

    Faixa de IPs: 172.29.0.100 – 172.29.0.200

    Gateway distribuído: 172.29.0.253

Testes:

docker exec -it ubuntu-test dhclient -v
docker exec -it ubuntu-test ip route

📁 FTP (vsftpd)

    IP: 172.28.0.51

    Portas: 20, 21, 10090-10100

Testes:
ftp 172.28.0.51

🔥 Firewall (iptables)

    IPs: 172.28.0.30 e 172.29.0.30

Testes:

docker exec -it firewall iptables -L -v -n

🔐 LDAP (OpenLDAP)

    IP: 172.28.0.60

    Portas: 389, 636

    Base DN: dc=fastfood,dc=local

Testes:

ldapsearch -x -H ldap://172.28.0.60 -b dc=fastfood,dc=local


💻 SAMBA

    IP: 172.28.0.61

    Compartilhamento: /samba/public

Testes:
smbclient //172.28.0.61/public -U usuario

🌐 Web Server (Apache2)

    IP: 172.28.0.50

    Porta: 8080

Acesso:

http://localhost:8080

🌉 Roteador

    -IPs: 172.28.0.253 (servidores), 172.29.0.253 (clientes)

    -Função: NAT, roteamento entre redes


Testes:
- docker exec -it ubuntu-test ping -c 3 172.28.0.10

🧪 Script de Testes Automatizados

Após subir os containers, execute:

sudo docker exec -it ubuntu-test /root/testes.sh


Esse script valida:

    Rota padrão

    Conectividade com gateway

    Resolução de DNS direta e reversa

    Acesso a serviços LDAP, FTP, Web


📄 Autores

    Luis Fernando 👨‍💻

    Ítalo 👨‍💻

    Thiago Silva 👨‍💻


Professor orientador: Roitier Campos Gonçalves


📚 Licença
Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.


🧠 Notas Finais
Este projeto é uma simulação acadêmica de um ambiente corporativo em containers.
Embora funcional, o uso em produção requer melhorias em segurança, monitoramento e persistência de dados.
