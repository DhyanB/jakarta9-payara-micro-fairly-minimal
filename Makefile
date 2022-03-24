APP_NAME=microservice
CONTAINER_NAME=${APP_NAME}

ifeq ($(OS),Windows_NT)
    DOCKER_CMD=docker
    DOCKER_COMPOSE_CMD=sudo docker-compose
    GRADLE_CMD=gradlew
else
    DOCKER_CMD=sudo docker
    DOCKER_COMPOSE_CMD=sudo docker-compose
    GRADLE_CMD=./gradlew
endif

help:
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "    help           Show this help message."
	@echo "    b              Build."
	@echo "    cb             Clean and build."
	@echo "    bt             Build and test."
	@echo "    cbt            Clean, build and test."
	@echo "    up             Build images and start containers."
	@echo "    down           Stop and remove containers."
	@echo "    run            Down, up, logs in a single command."
	@echo "    logs           Observe application logs."
	@echo "    status         Show the applications container status and mounted volumes."
	@echo "    shell          Get a shell in the application container."
	@echo "    restart        Restart the application container to reload the WAR file."
	@echo "    cycle          Build the WAR file and restart the application container without cleaning or testing."
	@echo ""

b:
	$(GRADLE_CMD) build -x test

cb:
	$(GRADLE_CMD) clean build -x test

bt:
	$(GRADLE_CMD) build

cbt:
	$(GRADLE_CMD) clean build

up:
	$(DOCKER_COMPOSE_CMD) up --build --detach

down:
	$(DOCKER_COMPOSE_CMD) down

run:
	make down && make up && make logs

logs:
	@$(DOCKER_CMD) logs --follow $(CONTAINER_NAME)

status:
	@$(DOCKER_CMD) container ls --filter=name=$(CONTAINER_NAME) --format "table {{.Status}}\t{{.Ports}}\t{{.Mounts}}" --no-trunc

shell:
	$(DOCKER_CMD) exec -it $(CONTAINER_NAME) sh

restart:
	$(DOCKER_CMD) restart $(CONTAINER_NAME)

cycle:
	$(GRADLE_CMD) build -x test
	$(DOCKER_CMD) restart $(CONTAINER_NAME)
