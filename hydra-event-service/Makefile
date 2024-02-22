deps:
	python -m pip install poetry
	poetry install

migrate:
	poetry run python -m src.utils.migrate

populate:
	poetry run python -m src.utils.populate

run:
	poetry run uvicorn src.app:app --reload --host 0.0.0.0
