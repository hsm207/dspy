setup:
	poetry install --with dev && \
		sudo apt-get update && \
		sudo apt-get install -y python3-dev && \
		poetry run pip install ipykernel