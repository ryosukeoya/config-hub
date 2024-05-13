SHELL := /bin/zsh
.DEFAULT_GOAL = echo_targets

targets := $(shell ls -d */ | sed -e 's#/$$# #g' | tr -d '\n')

e: echo_targets
echo_targets:
	@echo ${targets}

.PHONY: all
all: $(targets) ## pull all the specified targets

.PHONY: $(targets)
$(targets): ## pull the specified targets
	@echo "Pulling $@"
	git subtree pull --prefix $@ $@ windows-baleen-studio
