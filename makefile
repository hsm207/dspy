setup:
	poetry install --with dev && \
		sudo apt-get update && \
		sudo apt-get install -y python3-dev && \
		poetry run pip install ipykernel

model=meta-llama/Llama-2-7b-hf
num_shard=2
volume=$$PWD/data

tgi:
	if [ ! -d "text-generation-inference" ]; then \
		git clone https://github.com/huggingface/text-generation-inference.git; \
	fi	
	cd text-generation-inference && \
	docker run --gpus all \
		--shm-size 1g \
		-p 8080:80 \
		-v $(volume):/data \
		ghcr.io/huggingface/text-generation-inference:0.9 \
		--model-id $(model) \
		--num-shard $(num_shard)
