ELK_APP ?= elk
ELK_CONFIG ?= standard.yml
DOCKER_COMPOSE ?= docker-compose

EXTRA_IMAGES = 												\
	cogniteev/elk-kibana-config:latest 	\
	cogniteev/elk-logstash:latest 			\
	cogniteev/elk-export-es-index

ps:
	@$(DOCKER_COMPOSE) -p $(ELK_APP) -f $(ELK_CONFIG) $@

env:
	@echo alias dc-$(ELK_APP)=\"$(DOCKER_COMPOSE) -p ''\''$(ELK_APP)'\''' -f ''\''$(PWD)/$(ELK_CONFIG)'\'''\"

pull:
	$(DOCKER_COMPOSE) -f $(ELK_CONFIG) pull
	$(foreach image,$(EXTRA_IMAGES),docker pull $(image);)
