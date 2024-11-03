# **************************************************************************** #
#                                  Makefile                                    #
# **************************************************************************** #

# Variables
DOCKER_COMPOSE = docker-compose -f srcs/docker-compose.yml

# Targets
all: up

up:
	@$(DOCKER_COMPOSE) up -d
	@echo "Docker containers are now running."

down:
	@$(DOCKER_COMPOSE) down
	@echo "Docker containers have been stopped."

clean: down
	@$(DOCKER_COMPOSE) rm -f
	@echo "Docker containers have been removed."

re: clean all

.PHONY: all up down clean re
