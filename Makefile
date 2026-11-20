.PHONY: help start stop restart down pull ps logs clean

# Docker Compose command
DOCKER_COMPOSE = docker compose

help: ## Show this help
	@echo "GraphRAG Starter - Makefile Commands"
	@echo "===================================="
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
	@echo ""

start: ## Start all services
	$(DOCKER_COMPOSE) up -d

stop: ## Stop all services
	$(DOCKER_COMPOSE) stop

restart: ## Restart all services
	$(DOCKER_COMPOSE) restart

down: ## Stop and remove containers, networks
	$(DOCKER_COMPOSE) down

pull: ## Pull latest images
	$(DOCKER_COMPOSE) pull

ps: ## Show running containers
	$(DOCKER_COMPOSE) ps

logs: ## Show logs for all services
	$(DOCKER_COMPOSE) logs -f

logs-%: ## Show logs for a specific service
	$(DOCKER_COMPOSE) logs -f $$*

clean: ## Remove all data and images
	$(DOCKER_COMPOSE) down -v --rmi all
	-rm -rf ./data/**/*

# Initialize: Pull base model
init:
	@echo "Pulling a base model (llama3.2:3b)..."
	 curl -X POST http://localhost:11434/api/pull -d '{"name": "llama3.2:3b"}' -H "Content-Type: application/json"

# Health check
health:
	@echo "Checking service health..."
	@$(DOCKER_COMPOSE) ps
	@echo ""
	@echo "Testing endpoints..."
	@curl -s -o /dev/null -w "Ollama:  %{http_code}\n" http://localhost:11434/api/tags || echo "Ollama:  DOWN"
	@curl -s -o /dev/null -w "Qdrant:  %{http_code}\n" http://localhost:6333 || echo "Qdrant:  DOWN"
	@curl -s -o /dev/null -w "Neo4j:   %{http_code}\n" http://localhost:7474 || echo "Neo4j:   DOWN"
