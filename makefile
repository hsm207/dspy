setup:
	poetry install --with dev && \
		sudo apt-get update && \
		sudo apt-get install -y python3-dev && \
		poetry run pip install ipykernel huggingface_hub accelerate


test-tgi:
	curl http://llm:80/generate \
    -X POST \
    -d '{"inputs":"What is Deep Learning?","parameters":{"max_new_tokens":20}}' \
    -H 'Content-Type: application/json'