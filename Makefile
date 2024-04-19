DOCKER_COMPOSE_DIR = ./docker-compose

all:
	cd $(DOCKER_COMPOSE_DIR) && docker compose -f ./docker-compose.yml up -d --build

up:
	cd $(DOCKER_COMPOSE_DIR) && docker compose -f ./docker-compose.yml up -d

dev: down
	cd $(DOCKER_COMPOSE_DIR) && docker compose -f ./docker-compose.yml up

down:
	cd $(DOCKER_COMPOSE_DIR) && docker compose -f ./docker-compose.yml down

fclean: down
	cd $(DOCKER_COMPOSE_DIR) && docker system prune -fa --volumes
	rm -rf $(DOCKER_COMPOSE_DIR)/postgres_data:/var/lib/postgresql/data/

re: fclean all
