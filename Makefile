.DEFAULT_GOAL := help

.PHONY: help
help: ## show help
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: build-debian12
debian12: ## build debian 12
	docker build -t local/postfix-tls13-testbed:$@ -f Dockerfile.$@ .

.PHONY: build-debian10
debian10: ## build debian 10
	docker build -t local/postfix-tls13-testbed:$@ -f Dockerfile.$@ .

.PHONY: run-debian12
run-debian12: ## run debain 12
	@docker run -it --rm -p 25:25 local/postfix-tls13-testbed:debian12 run.sh

.PHONY: run-debian10
run-debian12: ## run debain 10
	@docker run -it --rm -p 25:25 local/postfix-tls13-testbed:debian10 run.sh
