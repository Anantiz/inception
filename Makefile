up:
	@docker-compose -f srcs/docker-compose.yaml up

build:
	mkdir -p /home/myos/data/mariadb /home/myos/data/wordpress /home/myos/data/bonus_site
	docker-compose -f srcs/docker-compose.yaml build

down:
	@docker-compose -f srcs/docker-compose.yaml down

clean: down
	# @docker system prune -f
	sudo rm -rf /home/myos/data/mariadb /home/myos/data/wordpress /home/myos/data/bonus_site

re: clean build up

redo: down build up

monitor:
	docker events --filter container=mariadb --filter container=wordpress --filter container=nginx

.PHONY: up build down clean re
