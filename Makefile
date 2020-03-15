include .env

.PHONY: test

DOCKER=docker
DOCKER_COMPOSE=docker-compose
DB_YML=docker-compose-databases.yml

default: build

dc-build:
	$(DOCKER_COMPOSE) build app

# ---------- DEVELOPMENT ----------

start: dc-build
	$(DOCKER_COMPOSE) run --service-ports app start

 # Starts the database dependencies via docker-compose in detached mode
start-dbs:
	$(DOCKER_COMPOSE) -f $(DB_YML) up -d

# Stops the database dependencies
stop-dbs:
	$(DOCKER_COMPOSE) -f $(DB_YML) down

sh: dc-build-app
	$(DOCKER_COMPOSE) run --entrypoint=sh --service-ports --rm app

lint: dc-build-app
	$(DOCKER_COMPOSE) run app run lint

dc-build-app:
	$(DOCKER_COMPOSE) build app

# ---------- TEST ----------

test: dc-build
	$(DOCKER_COMPOSE) run -e NODE_ENV=test app run test

coverage: dc-build
	$(DOCKER_COMPOSE) run -e NODE_ENV=test app run coverage

