DOCKER_COMP = docker compose
PHP         = $(DOCKER_COMP) exec php
CONSOLE     = $(PHP) bin/console
COMPOSER    = $(PHP) composer

.PHONY: up down sh sf composer test

up:
	$(DOCKER_COMP) up -d

down:
	$(DOCKER_COMP) down

sh:
	$(PHP) sh

sf: ## make sf c="doctrine:migrations:migrate"
	$(CONSOLE) $(c)

composer: ## make composer c="require symfony/orm-pack"
	$(COMPOSER) $(c)

test:
	$(PHP) bin/phpunit
