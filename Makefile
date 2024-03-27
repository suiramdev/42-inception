.PHONY: start stop build clean rebuild

start:
	docker-compose -f srcs/docker-compose.yml up -d

stop:
	docker-compose -f srcs/docker-compose.yml down

build:
	docker-compose -f srcs/docker-compose.yml build

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all

rebuild: stop build start
