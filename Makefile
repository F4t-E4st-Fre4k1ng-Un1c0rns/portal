start:
	docker compose up --build -d

update-api:
	docker compose cp ./event/ event-service:.

update-pkgs:
	docker compose cp ./event/pyproject.toml event-service:/event
	docker compose exec -w /event event-service poetry install