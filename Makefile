.PHONY: build \
	run-postgresql \
	stop-postgresql \
	stop-all

PORT ?= 5432

# Check if the PROJECT variable is set
ifdef_check = $(if $(PROJECT),,@echo "PROJECT variable is not set or empty"; exit 1)

# Target for building Docker image
build:
	$(call ifdef_check)
	docker build --progress=plain --no-cache -t $(PROJECT) .

# Target for running Docker container in the background and exposing port 5432
run-postgresql:
	$(call ifdef_check)
	docker run -d -p $(PORT):5432 --name $(PROJECT) $(PROJECT)

stop-postgresql:
	$(call ifdef_check)
	docker stop $(PROJECT)
	docker rm $(PROJECT)

stop-all:
	docker ps -q | xargs -L1 docker rm -f

run-psql:
	docker exec -it $(PROJECT) psql -U postgres

