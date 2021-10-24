APP_NAME=microservice
CONTAINER_NAME=${APP_NAME}

ifeq ($(OS),Windows_NT)
    GRADLE_CMD=gradlew
else
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
	docker-compose up --build --detach

down:
	docker-compose down

logs:
	@docker logs --follow $(CONTAINER_NAME)

status:
	@docker container ls --filter=name=$(CONTAINER_NAME) --format "table {{.Status}}\t{{.Ports}}\t{{.Mounts}}" --no-trunc

shell:
	docker exec -it $(CONTAINER_NAME) sh

restart:
	docker restart $(CONTAINER_NAME)

cycle:
	$(GRADLE_CMD) build -x test
	docker restart $(CONTAINER_NAME)
