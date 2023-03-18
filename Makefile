name = inception

all:
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build:
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

up:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d
down:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re: down
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean: down
#	that removes all unused resources from the Docker host, stopped containers 
#	unused images, unused volumes
	@docker system prune -a

	@docker volume prune -y
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*
	@sudo rm -rf ~/data

fclean:
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*
	@sudo rm -rf ~/data

.PHONY	: all build down up re clean fclean
