up:
	docker compose -f srcs/docker-compose.yml up -d
build:
	docker compose -f srcs/docker-compose.yml up --build -d