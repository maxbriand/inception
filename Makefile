# **************************************************************************** #
#                                  Makefile                                    #
# **************************************************************************** #

# Variables
DOCKER_COMPOSE_PATH = srcs/docker-compose.yml

# Targets
all: up

up:
	@docker compose -f $(DOCKER_COMPOSE_PATH) up --build
	@echo "Docker containers are now running."

down:
	@docker compose -f $(DOCKER_COMPOSE_PATH) down
	@echo "Docker containers have been stopped."

clean: down
	@docker system prune -af
	@echo "Docker containers have been removed."

re: clean all

.PHONY: all up down clean re
