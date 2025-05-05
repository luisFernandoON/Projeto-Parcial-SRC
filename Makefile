# Makefile - Gerenciador de comandos para infraestrutura Docker

# Sobe todos os containers em modo detached
up:
	docker-compose up -d --build

# Derruba todos os containers
down:
	docker-compose down

# Reconstrói as imagens
build:
	docker-compose build

# Roda os testes no container ubuntu-test
test:
	docker exec -it ubuntu-test bash /root/testes.sh

# Executa o container 'testes' para rodar o script e encerrar
test-run:
	docker-compose run --rm testes

# Verifica status dos containers
status:
	docker-compose ps

# Verifica logs de um container (ex: make logs SERVICE=dns)
logs:
	docker-compose logs -f $(SERVICE)

