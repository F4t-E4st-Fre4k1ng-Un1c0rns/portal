start:
	docker compose up --build -d
	docker compose rm -f

update:
	docker stop portal-nginx-1
	docker rm portal-nginx-1
	docker volume rm portal_web
	docker compose up --build -d
	docker compose rm -f

update-api:
	docker compose cp ./event/ event-service:.

update-pkgs:
	docker compose cp ./event/pyproject.toml event-service:/event
	docker compose exec -w /event event-service poetry install