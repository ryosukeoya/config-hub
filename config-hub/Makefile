SHELL := /bin/bash
.DEFAULT_GOAL = echo_targets

targets := $(shell ls -d */ | sed -e 's#/$$# #g' | tr -d '\n')

.PHONY: e echo_targets
e: echo_targets
echo_targets:
	@echo ${targets}

.PHONY: all
all: $(targets) ## pull all the specified targets

.PHONY: $(targets)
$(targets): ## pull the specified targets
	@echo "Pulling $@"
	git subtree pull --prefix $@ $@ windows-baleen-studio

.PHONY: tag
tag: ## git tag $(date +%Y-%m-%d-%H%M%S)
	git tag $(shell date +%Y-%m-%d-%H%M%S)
