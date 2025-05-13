# 🚀 FASTFOOD - Infraestrutura de Rede com Docker

Projeto desenvolvido para a disciplina **Serviços de Redes de Computadores** – 5º Período – IF Goiano.

Este projeto simula a infraestrutura de TI de uma rede de fast foods utilizando **Docker**, com serviços de rede essenciais distribuídos em sub-redes separadas, interligadas por um container roteador.

---

## 🎯 Objetivo

Implementar uma infraestrutura de rede corporativa com os seguintes serviços:

- DNS (Bind9)
- DHCP (ISC DHCP)
- FTP (vsftpd)
- Firewall (iptables)
- LDAP (OpenLDAP)
- SAMBA
- Web Server (Apache)
- Roteador com NAT e regras de roteamento

---

## 📂 Estrutura de Diretórios

```
Projeto-Parcial-SRC/
├── containers/
│   ├── dhcp/
│   ├── dns/
│   ├── ftp/
│   ├── ldap/
│   ├── router/
│   ├── samba/
│   └── webserver/
├── scripts/
│   ├── testes.sh
│   └── outros scripts
├── logs/
├── docker-compose.yml
├── README.md
└── Makefile
```

---

## ⚙️ Requisitos

- Docker
- Docker Compose
- Git
- Linux (recomendado: Ubuntu 22.04+)

---

## 🚀 Como Executar

```bash
# 1. Clone o repositório
git clone https://github.com/seu-usuario/Projeto-Parcial-SRC.git
cd Projeto-Parcial-SRC

# 2. Suba a infraestrutura
sudo docker-compose up -d --build

# 3. (Opcional) Execute testes automatizados
sudo docker exec -it testes /scripts/testes.sh
```

---

## 🌐 Topologia da Rede

| Rede             | Sub-rede         | Serviços                                             |
|------------------|------------------|------------------------------------------------------|
| rede_servidores  | 192.168.1.0/24   | DNS, FTP, Web, LDAP, SAMBA                          |
| rede_clientes    | 192.168.2.0/24   | Cliente com DHCP, container de testes               |

---

## 🧪 Serviços e Testes

### DNS - Bind9
- IP: 192.168.1.10
- Testes:
  ```bash
  dig @192.168.1.10 ftp.fastfood.local +short
  dig -x 192.168.1.50 @192.168.1.10 +short
  ```

### DHCP - ISC DHCP
- IP: 192.168.2.10
- Range: 192.168.2.100–192.168.2.200
- Gateway: 192.168.2.254
- Testes:
  ```bash
  sudo docker exec -it ubuntu-test dhclient -v
  sudo docker exec -it ubuntu-test ip a
  ```

### FTP - vsftpd
- IP: 192.168.1.20
- Portas: 21, 30000–30009

### Web Server - Apache
- IP: 192.168.1.50
- Porta: 80
- Acesso via: http://localhost:8080

### LDAP - OpenLDAP
- IP: 192.168.1.30
- Porta: 389
- Testes:
  ```bash
  ldapsearch -x -H ldap://192.168.1.30 -b dc=fastfood,dc=local
  ```

### SAMBA
- IP: 192.168.1.40
- Compartilhamento: /samba/public
- Teste:
  ```bash
  smbclient //192.168.1.40/public -U usuario
  ```

### Roteador
- IPs: 192.168.1.254 (servidores), 192.168.2.254 (clientes)
- Funções: NAT, roteamento, firewall via iptables

---

## ✅ Testes Automatizados

Execute:
```bash
make test-run
```
Ou manualmente:
```bash
sudo docker-compose run --rm testes
```

Verificações realizadas:
- Rota padrão
- Ping ao gateway
- DNS direto e reverso
- Acesso a serviços LDAP, FTP e Web

---

## 🖥️ Esquema de Redes:

![Imagem do WhatsApp de 2025-05-13 à(s) 16 23 40_6775236e](https://github.com/user-attachments/assets/680e30f9-fccc-4ae5-af8f-b7eb90e22fb4)


---

## 👨‍💻 Autores

- Luis Fernando
- Ítalo
- Thiago Silva

**Professor Orientador:** Roitier Campos Gonçalves

---

## 📄 Licença

Este projeto está sob a licença MIT.

