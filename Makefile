.PHONY: docker-build docker-run stop stop-all

PORT ?= 5432

# Check if the IMAGE_NAME variable is set
ifeq ($(strip $(IMAGE_NAME)),)
	$(error IMAGE_NAME is not set)
endif

# Target for building Docker image
build:
	docker build --progress=plain --no-cache -t $(IMAGE_NAME) .

# Target for running Docker container in the background and exposing port 5432
run:
	docker run -d -p $(PORT):5432 --name $(IMAGE_NAME)_$(PORT) $(IMAGE_NAME)

stop:
	docker stop $(IMAGE_NAME)_$(PORT)
	docker rm $(IMAGE_NAME)_$(PORT)

stop-all:
	docker ps -q | xargs -L1 docker rm -f
