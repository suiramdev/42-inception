.PHONY: start stop build clean rebuild

start:
	mkdir -p /Users/${USER}/data
	mkdir -p /Users/${USER}/data/wordpress
	mkdir -p /Users/${USER}/data/mariadb
	docker-compose -f srcs/docker-compose.yml up -d

stop:
	docker-compose -f srcs/docker-compose.yml down

build:
	docker-compose -f srcs/docker-compose.yml build

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all
	docker volume rm wordpress
	docker volume rm mariadb
  rm -rf /Users/${USER}/data

re: clean build start

rebuild: start stop build clean
