# 🌐 Projeto FASTFOOD - Infraestrutura de Rede com Docker

Este projeto simula uma infraestrutura corporativa completa de rede para a empresa fictícia **Fastfood Corp**, utilizando **Docker** para orquestrar os serviços em ambientes isolados e replicáveis.


---

## 📦 Serviços Implementados

| Serviço   | IP             | Porta(s)           | Descrição                                         |
|-----------|----------------|--------------------|--------------------------------------------------|
| Router    | 192.168.1.254 / 192.168.2.254 | -              | Roteamento entre as redes                        |
| DHCP      | 192.168.2.2    | -                  | Concede IP aos clientes                          |
| DNS       | 192.168.1.10   | 53 (TCP/UDP)       | Resolução de nomes e zona reversa                |
| Firewall  | 192.168.1.5    | -                  | Regras de filtragem com iptables                 |
| LDAP      | 192.168.1.50   | 389                | Diretório com base de usuários e grupos          |
| SAMBA     | 192.168.1.60   | 445                | Compartilhamento de arquivos                     |
| FTP       | 192.168.1.70   | 20-21, 10090–10100 | Acesso a arquivos por protocolo FTP              |
| Web       | 192.168.1.80   | 80 (via 8080)      | Página da empresa no Apache                      |
| Cliente   | 192.168.2.3    | -                  | Container de teste com ferramentas de validação  |

---

## 🖥️ Estrutura de Diretórios

```
📁 projeto-fastfood/
├── containers/
│   ├── dhcp/
│   ├── dns/
│   ├── firewall/
│   ├── ftp/
│   ├── ldap/
│   ├── router/
│   ├── samba/
│   ├── ubuntu-test/
│   └── webserver/
├── docker-compose.yml
└── README.md
```

---

## 🚀 Como Rodar no Linux

1. **Clone o repositório:**
```bash
git clone https://github.com/seuusuario/projeto-fastfood.git
cd projeto-fastfood
```

2. **Suba os serviços:**
```bash
sudo docker compose up -d --build
```

3. **Acesse o cliente de teste:**
```bash
sudo docker exec -it ubuntu_test bash
```

4. **Execute os testes:**
```bash
/root/testes.sh
```

---

## ✅ Testes Validados

O script `/root/testes.sh` realiza:

- Roteamento entre redes
- Resolução de nomes (DNS direto e reverso)
- Acesso ao site (Apache)
- Consulta ao diretório LDAP
- Login ao servidor FTP
- Conexão ao compartilhamento Samba
- Resposta do Firewall
- Diagnóstico geral de rede

---

## 🔐 Usuários Padrão (para testes)

- **Usuário:** `admin`
- **Senha:** `admin`

---

## 🧪 Requisitos

- Docker Engine `>= 20.10`
- Docker Compose v2
- Sistema Linux ou Docker Desktop no Windows
- Acesso sudo para subir os containers

---

## 👥 Créditos

Desenvolvido por Thiago  
Infraestrutura para a disciplina de **Serviços de Redes de Computadores - 2025/1**  
IF Goiano - Ceres

---

## 📬 Licença

Este projeto é de uso educacional e livre para estudo e colaboração.
