🚀 FASTFOOD — Infraestrutura de Rede com Docker

Simulação de uma infraestrutura corporativa para uma rede de fast foods, desenvolvida com Docker para a disciplina Serviços de Redes de Computadores (5º Período - IF Goiano).O projeto isola serviços em sub-redes e utiliza um roteador central com NAT e firewall.

🌟 Objetivo

Implementar, testar e documentar os seguintes serviços de rede em containers:

DNS (Bind9)

DHCP (ISC DHCP)

FTP (vsftpd)

LDAP (OpenLDAP)

SAMBA

Web Server (Apache)

Firewall (iptables)

Roteador (Ubuntu)

📁 Estrutura do Projeto

Projeto-Parcial-SRC/
├── containers/
│   ├── dhcp/         # Servidor DHCP
│   ├── dns/          # Servidor DNS
│   ├── ftp/          # Servidor FTP
│   ├── ldap/         # Servidor LDAP
│   ├── router/       # Roteador com NAT e firewall
│   ├── samba/        # Compartilhamento de arquivos
│   └── webserver/    # Servidor Apache
├── scripts/          # Scripts de inicialização e testes
│   ├── testes.sh
│   └── entrypoint.sh
├── docker-compose.yml
└── README.md

⚙️ Requisitos

Linux (Ubuntu 22.04+ recomendado)

Docker + Docker Compose

Git

Permissão sudo

🚀 Como Executar

# Clone o repositório
git clone https://github.com/luisFernandoON/Projeto-Parcial-SRC.git
cd Projeto-Parcial-SRC

# Suba os containers
sudo make up

# (Opcional) Execute os testes automatizados
make test-run
# Ou em modo resumido
make test-run ARGS=--resumido

🌐 Topologia de Rede

Rede

Sub-rede

Serviços

rede_servidores

192.168.1.0/24

DNS, FTP, Web, LDAP, SAMBA

rede_clientes

192.168.2.0/24

Clientes com DHCP, Ubuntu-Test

O container router conecta ambas as redes, realiza NAT e aplica regras de firewall.

🧰 Serviços Implementados

🤭 DNS (Bind9)

IP: 192.168.1.10

Resolve nomes como ftp.fastfood.local

dig ftp.fastfood.local @192.168.1.10
dig -x 192.168.1.50 @192.168.1.10

🚁 DHCP (ISC DHCP)

IP: 192.168.2.10

Faixa: 192.168.2.100–200

Gateway: 192.168.2.254

docker exec -it ubuntu-test dhclient -v
docker exec -it ubuntu-test ip a

📁 FTP (vsftpd)

IP: 192.168.1.20

Portas: 20, 21, 10090–10100

ftp ftp.fastfood.local

🔐 LDAP (OpenLDAP)

IP: 192.168.1.30

Porta: 389

Base DN: dc=fastfood,dc=local

ldapsearch -x -H ldap://192.168.1.30 -b dc=fastfood,dc=local

💻 SAMBA

IP: 192.168.1.40

Compartilhamento: /samba/public

smbclient //192.168.1.40/public -U usuario

🌐 Web Server (Apache2)

IP: 192.168.1.50

Acesso via: http://localhost:8080

🔥 Firewall (iptables)

Embutido no container router

Regras definidas para entrada, roteamento e NAT

docker exec -it router iptables -L -v -n

🎈 Roteador (Ubuntu com NAT)

IPs: 192.168.1.254 e 192.168.2.254

Faz roteamento entre as sub-redes

docker exec -it ubuntu-test ping -c 3 192.168.1.10

🧪 Testes Automatizados

Com o container testes:

make test-run         # modo completo
make test-run ARGS=--resumido

Valida:

Rota padrão e gateway

DNS direto e reverso

LDAP, FTP e Web

Resultados salvos em logs/testes.log

👥 Autores

Luis Fernando 👨‍💻

Ítalo 👨‍💻

Thiago Silva 👨‍💻

Orientador: Prof. Roitier Campos Gonçalves

📜 Licença

Distribuído sob a licença MIT. Veja LICENSE.

📌 Notas Finais

Este é um ambiente acadêmico com foco didático. Para uso real, recomenda-se:

Autenticação segura (SSL/TLS)

Persistência de dados (volumes)

Monitoramento e backups


